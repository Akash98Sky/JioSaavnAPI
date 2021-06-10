enum ItemType { ARTIST, ALBUM, PLAYLIST, SONG }

extension ItemTypeStringExt on String {
  ItemType? toItemType() => _itemTypeValues.map[this];
}

extension ItemTypeEnumExt on ItemType {
  String? reverse() => _itemTypeValues.reverse[this];
}

final _itemTypeValues = EnumValues({
  'album': ItemType.ALBUM,
  'artist': ItemType.ARTIST,
  'playlist': ItemType.PLAYLIST,
  'song': ItemType.SONG
});

class EnumValues<T> {
  final Map<String, T> map;
  Map<T, String>? _reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return _reverseMap ??= map.map((k, v) => MapEntry(v, k));
  }
}
