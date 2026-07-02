import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../utils/shared_pref_helper.dart';
import 'const_url.dart';
import 'error_handling/aadhaar_exception.dart';
import 'error_handling/exceptions.dart'; // Already correctly imported

class ApiProvider {
  ApiProvider();

  Uri _buildUri(String url, {Map<String, dynamic>? params}) {
    return Uri(
      scheme: baseScheme,
      host: baseDomain.split(":")[0],
      port:
          baseDomain.contains(":") ? int.parse(baseDomain.split(":")[1]) : null,
      path: '$pathExtender$url',
      queryParameters: params,
    );
  }

  /// Retrieves authentication headers.
  /// If [contentType] is null, 'Content-Type' header will not be added.
  /// This is useful for multipart requests where the content type is set by http.MultipartRequest.
  Future<Map<String, String>> _getAuthHeaders(
      {String? contentType = 'application/json; charset=UTF-8'}) async {
    String? userToken = await SharedPrefHelper.getAuthToken();
    debugPrint('ApiProvider: Retrieved token: $userToken');

    final Map<String, String> headers = {};

    if (contentType != null) {
      headers['Content-Type'] = contentType;
    }

    if (userToken != null && userToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $userToken';
    }

    return headers;
  }

  Future<dynamic> post(
      BuildContext context, String url, Map<String, dynamic> body,
      {Map<String, dynamic>? params}) async {
    try {
      var uri = _buildUri(url, params: params);

      if (url.contains('/login') || url.contains('/auth')) {
        final response = await http.post(
          uri,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        );

        debugPrint(
            'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            Map<String, dynamic> responseBodyMap = json.decode(response.body);
            String? accessToken = responseBodyMap['access_token'];

            if (accessToken != null && accessToken.isNotEmpty) {
              await SharedPrefHelper.setAuthToken(accessToken);
              debugPrint('Token saved. Now fetching headers...');
            } else {
              debugPrint('No access_token found in response.');
            }
          } catch (e) {
            debugPrint('Error parsing token: $e');
          }
        }

        return _response(context, response);
      }

      var mapHeader = await _getAuthHeaders();

      debugPrint(
          'request: $uri $url - Headers: $mapHeader - Body: ${jsonEncode(body)} ');

      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: mapHeader,
      );

      debugPrint(
          'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }

  Future<dynamic> patch(
      BuildContext context, String url, Map<String, dynamic> body,
      {Map<String, dynamic>? params}) async {
    try {
      var uri = _buildUri(url, params: params);
      var mapHeader = await _getAuthHeaders();

      final response = await http.patch(
        uri,
        body: jsonEncode(body),
        headers: mapHeader,
      );

      // debugPrint(
      //     'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }

  Future<dynamic> patchMultipart(
    BuildContext context,
    String url,
    Map<String, dynamic> body,
    File? imageFile, {
    required String imageFieldName,
    Map<String, dynamic>? params,
  }) async {
    try {
      var uri = _buildUri(url, params: params);
      var request = http.MultipartRequest('PATCH', uri);

      // Pass null for contentType to _getAuthHeaders so MultipartRequest sets it
      var mapHeader = await _getAuthHeaders(contentType: null);
      request.headers.addAll(mapHeader);

      body.forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      if (imageFile != null) {
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile(
          imageFieldName,
          stream,
          length,
          filename: imageFile.path.split('/').last,
          contentType: MediaType(
              'image', imageFile.path.split('.').last), // More robust MIME type
        );
        request.files.add(multipartFile);
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      debugPrint(
          'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }

  Future<dynamic> patchMultipartMoreImageSelected(BuildContext context,
      String url, Map<String, dynamic> fields, Map<String, File?> files,
      {Map<String, dynamic>? params}) async {
    try {
      var uri = _buildUri(url, params: params);
      var request = http.MultipartRequest('PATCH', uri);

      // Pass null for contentType to _getAuthHeaders so MultipartRequest sets it
      var mapHeader = await _getAuthHeaders(contentType: null);
      request.headers.addAll(mapHeader);

      // Add text fields to the request
      fields.forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });

      // Add files from the 'files' map to the request
      for (var entry in files.entries) {
        if (entry.value != null) {
          var file = entry.value!;
          var stream = http.ByteStream(file.openRead());
          var length = await file.length();

          // Determine the content type based on the file extension for robustness
          String? mimeType;
          String fileExtension = file.path.split('.').last.toLowerCase();
          if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
            mimeType = 'image/jpeg';
          } else if (fileExtension == 'png') {
            mimeType = 'image/png';
          } else if (fileExtension == 'pdf') {
            mimeType = 'application/pdf';
          }
          // Add more types as your application might handle (e.g., 'image/gif', 'image/webp', 'text/plain')

          var multipartFile = http.MultipartFile(
            entry.key,
            stream,
            length,
            filename: file.path.split('/').last,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          );
          request.files.add(multipartFile);
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      debugPrint(
          'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException(
          'No Internet Connection'); // Consistent exception
    } on http.ClientException catch (e) {
      throw FetchDataException(
          'HTTP Client Error: ${e.message}'); // Consistent exception
    } catch (e) {
      debugPrint('Error in patchMultipartMoreImageSelected: $e');
      throw FetchDataException(
          'Failed to send multipart request: ${e.toString()}'); // Consistent exception
    }
  }

  Future<dynamic> postWithListBody(
      BuildContext context, String url, List<dynamic> list) async {
    try {
      var uri = _buildUri(url);
      var mapHeader = await _getAuthHeaders();

      final response = await http.post(
        uri,
        body: jsonEncode(list),
        headers: mapHeader,
      );

      debugPrint(
          'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }

  Future<dynamic> get(
      BuildContext context, String url, Map<String, String> map) async {
    try {
      var uri = _buildUri(url, params: map);
      var mapHeader = await _getAuthHeaders();

      final response = await http.get(uri, headers: mapHeader);

      debugPrint(
          'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }

  Future<dynamic> delete(
      BuildContext context, String url, Map<String, String> map) async {
    try {
      var uri = _buildUri(url, params: map);
      var mapHeader = await _getAuthHeaders();

      final response = await http.delete(
        uri,
        body: jsonEncode(
            map), // Often delete requests don't have bodies, but if your API needs it, this is fine.
        headers: mapHeader,
      );

      debugPrint(
          'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }

  Future<dynamic> put(
      BuildContext context, String url, Map<String, dynamic> body,
      {Map<String, dynamic>? params}) async {
    try {
      var uri = _buildUri(url, params: params);
      var mapHeader = await _getAuthHeaders();

      final response = await http.put(
        uri,
        body: jsonEncode(body),
        headers: mapHeader,
      );

      debugPrint(
          'response: $uri $url - Status: ${response.statusCode} - Body: ${response.body}');
      return _response(context, response);
    } on SocketException {
      _showNoInternetDialog(context);
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }

  // Future<dynamic> _response(
  //     BuildContext context, http.Response response) async {
  //   switch (response.statusCode) {
  //     case 200:
  //     case 201:
  //       // Check if response body is empty before decoding
  //       if (response.body.isEmpty) {
  //         debugPrint(
  //             'Response body is empty for status ${response.statusCode}');
  //         return {}; // Or null, depending on your expected return type for empty successful responses
  //       }
  //       return json.decode(response.body);
  //     case 400:
  //     case 404:
  //     case 422:
  //       throw FetchDataException(response.body);
  //     case 401:
  //       await _handleUnauthorised(context);
  //       throw UnauthorisedException(
  //           'Unauthorized access. Redirecting to login.');
  //     default:
  //       throw FetchDataException(
  //           'Error occurred: ${response.statusCode}, ${response.body}');
  //   }
  // }

// In lib/data/network/api_provider.dart

  Future<dynamic> _response(
      BuildContext context, http.Response response) async {
    // --- ADD THESE DEBUG LOGS HERE ---
    debugPrint('[_response] Raw Response URL: ${response.request?.url}');
    debugPrint('[_response] Raw Response Status: ${response.statusCode}');
    debugPrint('[_response] Raw Response Headers: ${response.headers}');
    debugPrint(
        '[_response] Raw Response Body: "${response.body}"'); // Log raw body with quotes to see if it's truly empty

    dynamic decodedData;
    if (response.body.isNotEmpty) {
      try {
        decodedData = json.decode(response.body);
        debugPrint('[_response] Decoded JSON Data: $decodedData');
      } on FormatException catch (e) {
        debugPrint(
            '[_response] JSON Decoding FAILED for status ${response.statusCode}: $e');
        // If JSON decoding fails, we should immediately throw a specific error
        throw ServerException(
            'Failed to parse API response as JSON for URL: ${response.request?.url} (Status: ${response.statusCode}). Raw body: "${response.body}"');
      }
    } else {
      debugPrint(
          '[_response] Response body is EMPTY for status ${response.statusCode}.');
      // If the body is empty but status is success, return empty map or null
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {}; // Or null, depending on your expected success handling for empty bodies
      }
      // For non-200/201 empty bodies, throw an error
      throw ServerException(
          'Empty response body for non-success status ${response.statusCode} for URL: ${response.request?.url}');
    }
    // THIS IS THE CRUCIAL PART IN APIPROVIDER._RESPONSE
    if (decodedData is Map<String, dynamic> &&
        decodedData.containsKey('aadhar_api_response') &&
        decodedData['aadhar_api_response'] is Map<String, dynamic>) {
      final aadharApiResponse =
          decodedData['aadhar_api_response'] as Map<String, dynamic>;
      if (aadharApiResponse.containsKey('code') &&
          aadharApiResponse['code'] == 'insufficient_balance') {
        // *** IT THROWS AADHAARAPIEXCEPTION WITH THE INNER MESSAGE ***
        throw AadhaarApiException(
          aadharApiResponse['message'] ??
              'Insufficient balance for Aadhaar API.', // This is "Insufficient balance to process this request."
          code: aadharApiResponse['code'],
          type: aadharApiResponse['type'],
        );
      }
    }

    // Handle Aadhaar API specific error even if HTTP status is 200/201
    if (decodedData is Map<String, dynamic> &&
        decodedData.containsKey('aadhar_api_response') &&
        decodedData['aadhar_api_response'] is Map<String, dynamic>) {
      final aadharApiResponse =
          decodedData['aadhar_api_response'] as Map<String, dynamic>;
      if (aadharApiResponse.containsKey('code') &&
          aadharApiResponse['code'] == 'insufficient_balance') {
        throw AadhaarApiException(
          aadharApiResponse['message'] ??
              'Insufficient balance for Aadhaar API.',
          code: aadharApiResponse['code'],
          type: aadharApiResponse['type'],
        );
      }
      // You can add more specific Aadhaar API error codes here if needed
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        // If we reached here, it means it's a successful 200/201 response
        // and it either had no `aadhar_api_response` or a different one not indicating insufficient balance.
        return decodedData; // Return decoded data. We already handled empty body above.
      case 400:
      case 404:
      case 422:
        // ... (your existing code for these status codes)
        if (decodedData is Map<String, dynamic> &&
            decodedData.containsKey('message')) {
          throw FetchDataException(decodedData['message']);
        }
        throw FetchDataException(response.body);
      case 401:
        // ... (your existing code for 401)
        await _handleUnauthorised(context);
        throw UnauthorisedException(
            'Unauthorized access. Redirecting to login.');
      default:
        // ... (your existing default case)
        if (decodedData is Map<String, dynamic> &&
            decodedData.containsKey('message')) {
          throw FetchDataException(
              'Error occurred: ${response.statusCode}, ${decodedData['message']}');
        }
        throw FetchDataException(
            'Error occurred: ${response.statusCode}, ${response.body}');
    }
  }

  Future<void> _handleUnauthorised(BuildContext context) async {
    await SharedPrefHelper.clearAuthToken();
    debugPrint(
        'ApiProvider: Cleared token due to 401 Unauthorized and redirecting.');
    if (context.mounted) {
      // Ensure you're navigating on the main thread and context is still valid
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // route a login screen
        // router.go(RouteConstants.login);
      });
    }
  }

  void _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          child: Text("No internet"),
        );
      },
    );
  }
}
