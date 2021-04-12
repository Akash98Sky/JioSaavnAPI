import 'json_model.dart';
import '../extensions/string_ext.dart';

class Song extends JsonModel {
  Song({
    this.id,
    this.title,
    this.image,
    this.album,
    this.url,
    this.type,
    this.description,
    this.ctr,
    this.position,
    this.moreInfo,
  });

  final String? id;
  final String? title;
  final String? image;
  final String? album;
  final String? url;
  final String? type;
  final String? description;
  final int? ctr;
  final int? position;
  final MoreInfo? moreInfo;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        album: json['album'],
        url: json['url'],
        type: json['type'],
        description: json['description'],
        ctr: json['ctr'],
        position: json['position'],
        moreInfo: MoreInfo.fromJson(json['more_info']),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'album': album,
        'url': url,
        'type': type,
        'description': description,
        'ctr': ctr,
        'position': position,
        'more_info': moreInfo?.toJson(),
      };
}

class MoreInfo {
  MoreInfo({
    this.vcode,
    this.vlink,
    this.primaryArtists,
    this.singers,
    this.videoAvailable,
    this.trillerAvailable,
    this.language,
  });

  final String? vcode;
  final String? vlink;
  final String? primaryArtists;
  final String? singers;
  final dynamic videoAvailable;
  final bool? trillerAvailable;
  final String? language;

  factory MoreInfo.fromJson(Map<String, dynamic> json) => MoreInfo(
        vcode: json['vcode'],
        vlink: json['vlink'],
        primaryArtists: json['primary_artists'],
        singers: json['singers'],
        videoAvailable: json['video_available'],
        trillerAvailable: json['triller_available'],
        language: json['language'],
      );

  Map<String, dynamic> toJson() => {
        'vcode': vcode,
        'vlink': vlink,
        'primary_artists': primaryArtists,
        'singers': singers,
        'video_available': videoAvailable,
        'triller_available': trillerAvailable,
        'language': language,
      };
}

class SongDetails {
  SongDetails({
    this.id,
    this.type,
    this.song,
    this.album,
    this.year,
    this.music,
    this.musicId,
    this.primaryArtists,
    this.primaryArtistsId,
    this.featuredArtists,
    this.featuredArtistsId,
    this.singers,
    this.starring,
    this.image,
    this.label,
    this.albumid,
    this.language,
    this.origin,
    this.playCount,
    this.copyrightText,
    this.is320Kbps,
    this.isDolbyContent,
    this.explicitContent,
    this.hasLyrics,
    this.lyricsSnippet,
    this.encryptedMediaUrl,
    this.encryptedMediaPath,
    this.mediaPreviewUrl,
    this.permaUrl,
    this.albumUrl,
    this.duration,
    this.rights,
    this.starred,
    this.artistMap = const {},
    this.releaseDate,
    this.trillerAvailable,
    this.labelUrl,
  });

  final String? id;
  final String? type;
  final String? song;
  final String? album;
  final int? year;
  final String? music;
  final String? musicId;
  final String? primaryArtists;
  final String? primaryArtistsId;
  final String? featuredArtists;
  final String? featuredArtistsId;
  final String? singers;
  final String? starring;
  final String? image;
  final String? label;
  final int? albumid;
  final String? language;
  final String? origin;
  final int? playCount;
  final String? copyrightText;
  final bool? is320Kbps;
  final bool? isDolbyContent;
  final int? explicitContent;
  final bool? hasLyrics;
  final String? lyricsSnippet;
  final String? encryptedMediaUrl;
  final String? encryptedMediaPath;
  final String? mediaPreviewUrl;
  final String? permaUrl;
  final String? albumUrl;
  final int? duration;
  final Rights? rights;
  final bool? starred;
  final Map<String, String> artistMap;
  final DateTime? releaseDate;
  final bool? trillerAvailable;
  final String? labelUrl;

  factory SongDetails.fromJson(Map<String, dynamic> json) => SongDetails(
        id: json['id'],
        type: json['type'],
        song: json['song'],
        album: json['album'],
        year: json['year'] == null ? null : int.parse('${json['year']}'),
        music: json['music'],
        musicId: json['music_id'],
        primaryArtists: json['primary_artists'],
        primaryArtistsId: json['primary_artists_id'],
        featuredArtists: json['featured_artists'],
        featuredArtistsId: json['featured_artists_id'],
        singers: json['singers'],
        starring: json['starring'],
        image: json['image'],
        label: json['label'],
        albumid: json['albumid'] == null ? null : int.parse(json['albumid']),
        language: json['language'],
        origin: json['origin'],
        playCount: json['play_count'] == null
            ? null
            : int.parse('${json['play_count']}'),
        copyrightText: json['copyright_text'],
        is320Kbps: json['320kbps'] is String
            ? (json['320kbps'] as String).toBool()
            : json['320kbps'],
        isDolbyContent: json['is_dolby_content'],
        explicitContent: json['explicit_content'],
        hasLyrics: json['has_lyrics'] is String
            ? (json['has_lyrics'] as String).toBool()
            : json['has_lyrics'],
        lyricsSnippet: json['lyrics_snippet'],
        encryptedMediaUrl: json['encrypted_media_url'],
        encryptedMediaPath: json['encrypted_media_path'],
        mediaPreviewUrl: json['media_preview_url'],
        permaUrl: json['perma_url'],
        albumUrl: json['album_url'],
        duration: json['duration'] == null ? null : int.parse(json['duration']),
        rights: json['rights'] == null ? null : Rights.fromJson(json['rights']),
        starred: json['starred'] is String
            ? (json['starred'] as String).toBool()
            : json['starred'],
        artistMap: Map.from(json['artistMap'] ?? {}),
        releaseDate: json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        trillerAvailable: json['triller_available'],
        labelUrl: json['label_url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'song': song,
        'album': album,
        'year': year,
        'music': music,
        'music_id': musicId,
        'primary_artists': primaryArtists,
        'primary_artists_id': primaryArtistsId,
        'featured_artists': featuredArtists,
        'featured_artists_id': featuredArtistsId,
        'singers': singers,
        'starring': starring,
        'image': image,
        'label': label,
        'albumid': albumid,
        'language': language,
        'origin': origin,
        'play_count': playCount,
        'copyright_text': copyrightText,
        '320kbps': is320Kbps,
        'is_dolby_content': isDolbyContent,
        'explicit_content': explicitContent,
        'has_lyrics': hasLyrics,
        'lyrics_snippet': lyricsSnippet,
        'encrypted_media_url': encryptedMediaUrl,
        'encrypted_media_path': encryptedMediaPath,
        'media_preview_url': mediaPreviewUrl,
        'perma_url': permaUrl,
        'album_url': albumUrl,
        'duration': duration,
        'rights': rights == null ? null : rights!.toJson(),
        'starred': starred,
        'artistMap': artistMap,
        'release_date': releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        'triller_available': trillerAvailable,
        'label_url': labelUrl,
      };
}

class Rights {
  Rights({
    this.code,
    this.reason,
    this.cacheable,
    this.deleteCachedObject,
  });

  final int? code;
  final String? reason;
  final bool? cacheable;
  final bool? deleteCachedObject;

  factory Rights.fromJson(Map<String, dynamic> json) => Rights(
        code: json['code'],
        reason: json['reason'],
        cacheable: json['cacheable'],
        deleteCachedObject: json['delete_cached_object'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'reason': reason,
        'cacheable': cacheable,
        'delete_cached_object': deleteCachedObject,
      };
}
