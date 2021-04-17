import 'dart:convert';

import 'package:dart_des/dart_des.dart';

Map<String, dynamic> formatSongJson(Map<String, dynamic> data) {
  var url = data['media_preview_url'] as String?;

  if (url != null) {
    url = url.replaceAll('preview', 'aac');

    if (data['320kbps'].toString() == 'true') {
      url = url.replaceFirst('_96_p.mp4', '_320.mp4');
    } else {
      url = url.replaceFirst('_96_p.mp4', '_160.mp4');
    }
    data['media_url'] = url;
  } else {
    data['media_url'] = _decryptUrl(data['encrypted_media_url']);
    if (data['320kbps'].toString() != 'true') {
      data['media_url'] =
          data['media_url'].replaceFirst('_320.mp4', '_160.mp4');
    }
  }

  data['song'] = _formatString(data['song']);
  data['music'] = _formatString(data['music']);
  data['singers'] = _formatString(data['singers']);
  data['starring'] = _formatString(data['starring']);
  data['album'] = _formatString(data['album']);
  data['primary_artists'] = _formatString(data['primary_artists']);
  data['image'] = data['image']?.replaceAll('150x150', '500x500');
  data['copyright_text'] = data['copyright_text']?.replaceFirst('&copy;', '©');

  return data;
}

Map<String, dynamic> formatAlbumJson(Map<String, dynamic> data) {
  data['image'] = data['image']?.replaceAll('150x150', '500x500');
  data['name'] = _formatString(data['name']);
  data['primary_artists'] = _formatString(data['primary_artists']);
  data['title'] = _formatString(data['title']);
  (data['songs'] as List).forEach((song) => formatSongJson(song));

  return data;
}

Map<String, dynamic> formatPlaylistJson(Map<String, dynamic> data) {
  data['firstname'] = _formatString(data['firstname']);
  data['listname'] = _formatString(data['listname']);
  (data['songs'] as List).forEach((song) => formatSongJson(song));

  return data;
}

String _formatString(String? str) => str!
    .replaceAll('&quot;', "'")
    .replaceAll('&amp;', '&')
    .replaceAll('&#039;', "'");

String _decryptUrl(String url) {
  final desECB = DES(key: '38346591'.codeUnits, mode: DESMode.ECB);
  final encUrl = base64Decode(url.trim());

  return utf8
      .decode(desECB.decrypt(encUrl))
      .replaceFirst('_96.mp4', '_320.mp4');
}
