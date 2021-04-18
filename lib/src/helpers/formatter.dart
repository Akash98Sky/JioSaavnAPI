import 'dart:convert';

import 'package:dart_des/dart_des.dart';

Map<String, dynamic> formatSongJson(Map<String, dynamic> data) {
  data['more_info']['media_url'] =
      _decryptUrl(data['more_info']['encrypted_media_url']);

  return data;
}

Map<String, dynamic> formatAlbumJson(Map<String, dynamic> data) {
  data['title'] = _formatString(data['title']);
  (data['list'] as List).forEach((song) => formatSongJson(song));

  return data;
}

Map<String, dynamic> formatPlaylistJson(Map<String, dynamic> data) {
  data['more_info']['firstname'] =
      _formatString(data['more_info']['firstname']);
  data['more_info']['lastname'] = _formatString(data['more_info']['lastname']);
  (data['list'] as List).forEach((song) => formatSongJson(song));

  return data;
}

String _formatString(String? str) => str!
    .replaceAll('&quot;', "'")
    .replaceAll('&amp;', '&')
    .replaceAll('&#039;', "'");

String _decryptUrl(String url) {
  final desECB = DES(key: '38346591'.codeUnits, mode: DESMode.ECB);
  final encUrl = base64Decode(url.trim());

  return utf8.decode(desECB.decrypt(encUrl));
}
