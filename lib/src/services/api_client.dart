import 'dart:convert';

import 'package:http/http.dart' as http;

typedef TransformFunc<T> = Future<T> Function(http.Response res);

class ApiClient {
  static const _userAgent =
      'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0';
  final _client = http.Client();

  Future<String> requestGetRaw(
    Uri url, {
    Map<String, String> headers = const {},
  }) async {
    final res =
        await _client.get(url, headers: {...headers, 'User-Agent': _userAgent});

    return res.body;
  }

  Future<List<Map<String, dynamic>>> requestGetListJson(
    Uri url, {
    Map<String, String> headers = const {},
  }) async {
    final res =
        await _client.get(url, headers: {...headers, 'User-Agent': _userAgent});

    return jsonDecode(res.body);
  }

  Future<Map<String, dynamic>> requestGetJson(
    Uri url, {
    Map<String, String> headers = const {},
  }) async {
    final res =
        await _client.get(url, headers: {...headers, 'User-Agent': _userAgent});

    return jsonDecode(res.body);
  }

  void close() {
    return _client.close();
  }
}
