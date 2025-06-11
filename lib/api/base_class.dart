
import 'dart:convert';

class BaseJson {
  bool _isSuccess;
  dynamic _data;
  String _message;

  BaseJson(this._isSuccess, this._data, this._message);

  factory BaseJson.fromResponseBody(String body) => BaseJson.fromJson(json.decode(body));

  factory BaseJson.fromJson(Map<String, dynamic> json) => BaseJson(
      json["isSuccess"],
      json["data"],
      json["message"]
  );

  get isSuccess => _isSuccess;
  get data => _data;
  get error => Exception(_message.isEmpty ? "Server error" : _message);
  get message => _message;
}