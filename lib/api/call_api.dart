import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'authentication.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'base_class.dart';

class ServerConnection {
  static final ServerConnection _singleton = ServerConnection._internal();

  static ServerConnection get instance => _singleton;

  ServerConnection._internal() {
    _client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);
  }

  InterceptedClient? _client;

  InterceptedClient get client {
    return _client!;
  }

  //Base Headers setup for all the requests
  Future<Map<String, String>> getHeaders(
      {required String version, Map<String, String>? map}) async {
    var check = {"Content-Type": "application/json", "x-version": "$version"};
    var token = "";// await SPManager.instance.token;
    if (token != null) check["authorization"] = "Bearer $token";
    if (map != null) check.addAll(map);
    return check;
  }

  Future<T> callMultipartApi<T>(Uri api,
      {String version = "1.1",
        Map<String, String>? headers,
        Map<String, List<File>>? filesMap,
        required Map<String, String> text,
        Function? parser,
        AuthenticationRepository? auth}) async {
    var request = http.MultipartRequest("POST", api);

    filesMap?.forEach((key, value) async {
      value.forEach((file) async {
        final mimeTypeData = lookupMimeType(file.path)?.split('/');
        request.files.add(await MultipartFile.fromPath(key, file.path,
            contentType: mimeTypeData != null
                ? MediaType(mimeTypeData[0], mimeTypeData[1])
                : MediaType("*", "*")));
      });
    });
    request.fields.addAll(text);
    request.headers.addAll(await getHeaders(version: version, map: headers));
    var response = await http.Response.fromStream(await request.send());
    return handleResponse<T>(response, parser, auth);
  }

  Future<T> callApiByNewVersion<T>(Uri api,
      {String version = "apiVerson",
        Map<String, String>? headers,
        Map<String, dynamic>? body,
        Function? parser,
        AuthenticationRepository? auth}) async {
    var response;
    try {
      response = await client.post(api,
          headers: await getHeaders(version: version, map: headers),
          body: jsonEncode(body));
    } catch (e) {
      throw Exception(
          'Connection Error - Please check your internet connection.');
    }
    return handleResponse<T>(response, parser, auth);
  }

  Future<T> callApi<T>(Uri api,
      {String version = "apiVerson",
        Map<String, String>? headers,
        Map<String, dynamic>? body,
        Function? parser,
        AuthenticationRepository? auth}) async {
    var response;
    try {
      response = await client.post(api,
          headers: await getHeaders(version: version, map: headers),
          body: jsonEncode(body));
    } catch (e) {
      throw Exception(
          'Connection Error - Please check your internet connection.');
    }
    return handleResponse<T>(response, parser, auth);
  }

  Future<Response> getData(Uri api,
      {String version = "apiVerson",
        Map<String, String>? headers,
        Map<String, dynamic>? body,
        AuthenticationRepository? auth}) async {
    try {
      return client.post(api,
          headers: await getHeaders(version: version, map: headers),
          body: jsonEncode(body));
    } catch (e) {
      throw Exception(
          'Connection Error - Please check your internet connection.');
    }
  }

  T handleResponse<T>(Response response,
      [Function? parser, AuthenticationRepository? auth]) {
    if (response.statusCode == 200) {
      final body = BaseJson.fromResponseBody(response.body);
      if (body.isSuccess == true) {
        if (body.data != null && parser != null) {

          return parser.call(body.data);
        } else {
          return body.message;
        }
      } else {
        throw body.error;
      }
    } else if (response.statusCode == 401 && auth != null) {
      logoutProcessing(auth);
      throw Exception('Unauthorized Error - 401');
    } else {
      final body = BaseJson.fromResponseBody(response.body);
      if(body.isSuccess==false){
        throw Exception('${body.message}');
      }

      throw Exception('Server Error - ${response.statusCode}');
    }
  }

  void logoutProcessing(AuthenticationRepository? auth) {
    auth?.logOut();
  }
}

class LoggerInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    log('----- Response -----');
    log('Code: ${response.statusCode}');
    log('Url: ${response.request?.url}');
    if (response is Response) {
      log((response).body);
    }
    return response;
  }
}
