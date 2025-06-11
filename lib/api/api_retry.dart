import 'dart:async';
import 'dart:math';
import 'package:http/http.dart' as http;

/// Retry-safe HTTP request
Future<http.Response> retryHttpRequest(
    Future<http.Response> Function() requestFn, {
      int maxAttempts = 5,
      Duration baseDelay = const Duration(seconds: 1),
    }) async {
  final random = Random();

  for (int attempt = 0; attempt < maxAttempts; attempt++) {
    print("attempt: $attempt");
    try {
      final response = await requestFn();

      if (_shouldRetry(response)) {
        // Optional: Read Retry-After header if present
        final retryAfter = _getRetryAfterDuration(response) ??
            baseDelay * pow(2, attempt) + Duration(milliseconds: random.nextInt(1000));

        await Future.delayed(retryAfter);
        continue;
      }

      return response; // Success or non-retryable status

    } catch (e) {
      print("attempt: $attempt, error: $e");
      if (attempt == maxAttempts - 1) rethrow;

      final delay = baseDelay * pow(2, attempt) + Duration(milliseconds: random.nextInt(1000));
      await Future.delayed(delay);
    }
  }

  throw Exception("Max retry attempts reached.");
}

/// Decide which status codes are retryable
bool _shouldRetry(http.Response response) {
  return [
    408, // Request Timeout
    429, // Too Many Requests
    500, 502, 503, 504 // Server errors
  ].contains(response.statusCode);
}

/// Parse Retry-After header if provided
Duration? _getRetryAfterDuration(http.Response response) {
  final retryAfter = response.headers['retry-after'];
  if (retryAfter == null) return null;

  final seconds = int.tryParse(retryAfter);
  if (seconds != null) {
    return Duration(seconds: seconds);
  }

  return null;
}


void fetchData() async {
  try {
    final response = await retryHttpRequest(() {
      return http.get(Uri.parse("https://api.fintech.com/balance"));
    },);

    if (response.statusCode == 200) {
      print("Success: ${response.body}");
    } else {
      print("Failed after retries: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
