import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final Dio dio;
  final FlutterSecureStorage storage;

  ApiClient({
    required String baseUrl,
    required this.storage,
  }) : dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(
            key: 'access_token',
          );

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },

        onError: (error, handler) async {
          final statusCode = error.response?.statusCode;

          // केवल 401 पर Token Refresh करें।
          if (statusCode != 401) {
            return handler.next(error);
          }

          // Refresh API को दोबारा Refresh नहीं करना है।
          if (error.requestOptions.path == '/auth/refresh') {
            return handler.next(error);
          }

          // एक ही API request को बार-बार retry नहीं करना है।
          if (error.requestOptions.extra['retried'] == true) {
            return handler.next(error);
          }

          error.requestOptions.extra['retried'] = true;

          try {
            final refreshToken = await storage.read(
              key: 'refresh_token',
            );

            if (refreshToken == null || refreshToken.isEmpty) {
              return handler.next(error);
            }

            // अलग Dio इस्तेमाल करें ताकि Interceptor loop न बने।
            final refreshDio = Dio(
              BaseOptions(baseUrl: dio.options.baseUrl),
            );

            final response = await refreshDio.post(
              '/auth/refresh',
              data: {
                'refresh_token': refreshToken,
              },
            );

            final newAccessToken =
                response.data['access_token'] as String;

            await storage.write(
              key: 'access_token',
              value: newAccessToken,
            );

            // पुरानी API को नए Token से retry करें।
            final request = error.requestOptions;
            request.headers['Authorization'] =
                'Bearer $newAccessToken';

            final retryResponse = await dio.fetch(request);

            return handler.resolve(retryResponse);
          } catch (_) {
            // Refresh असफल होने पर session expired handle करें।
            return handler.next(error);
          }
        },
      ),
    );
  }
}
