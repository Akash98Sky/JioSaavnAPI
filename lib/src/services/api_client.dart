import 'dart:convert';

import 'package:http/http.dart' as http;

typedef TransformFunc<T> = Future<T> Function(http.Response res);

class ApiClient {
  final _client = http.Client();

  Future<String> requestGetRaw(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final res = await _client.get(url, headers: headers);

    return res.body;
  }

  Future<Map<String, dynamic>> requestGetJson(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final res = await _client.get(url, headers: headers);

    return jsonDecode(res.body);
  }
}
