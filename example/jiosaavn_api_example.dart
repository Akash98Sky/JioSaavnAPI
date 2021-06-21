import 'package:jiosaavn_api/jiosaavn_api.dart';

Future<void> main() async {
  var awesome = JioSaavn();

  print((await awesome.getLaunchData()).toJson().keys);

  // print((await awesome.getSongs(['iU7UPQsU', 'f6_mfbG0']))
  //     .map((x) => x.toJson()));

  // print((await awesome.searchAutocomplete('Jee le zara')).toJson());

  // print((await awesome.getAlbum('17900338')).toJson());

  // print((await awesome.getPlaylist('5148894')).toJson());
}
