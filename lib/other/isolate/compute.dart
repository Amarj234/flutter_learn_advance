import 'dart:convert';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> parseJson(String jsonStr) async {
  return await compute(_parseJson, jsonStr);
}

Map<String, dynamic> _parseJson(String jsonStr) {
  return json.decode(jsonStr);
}


// This function is an example of how to use compute with a list of arguments

Future<Map<String, dynamic>> parseJson2(String jsonStr) async {
  return await compute(_parseJson2, [jsonStr,10]);
}

Map<String, dynamic> _parseJson2(List <dynamic> args) {
  return json.decode(args[0]);
}
