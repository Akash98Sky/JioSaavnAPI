import 'json_model.dart';
import 'song.dart';

class Playlist extends JsonModel {
  Playlist({
    this.id,
    this.title,
    this.image,
    this.extra,
    this.url,
    this.language,
    this.type,
    this.description,
    this.position,
  });

  final String? id;
  final String? title;
  final String? image;
  final String? extra;
  final String? url;
  final String? language;
  final String? type;
  final String? description;
  final int? position;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        extra: json['extra'],
        url: json['url'],
        language: json['language'],
        type: json['type'],
        description: json['description'],
        position: json['position'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'extra': extra,
        'url': url,
        'language': language,
        'type': type,
        'description': description,
        'position': position,
      };
}

class PlaylistDetails {
  PlaylistDetails({
    this.listid,
    this.listname,
    this.permaUrl,
    this.followerCount,
    this.uid,
    this.lastUpdated,
    this.username,
    this.firstname,
    this.lastname,
    this.isFollowed,
    this.isFy,
    this.image,
    this.share,
    this.songs = const [],
    this.type,
    this.listCount,
    this.fanCount,
    this.h2,
    this.isDolbyPlaylist,
    this.subheading,
    this.videoAvailable,
  });

  final int? listid;
  final String? listname;
  final String? permaUrl;
  final int? followerCount;
  final String? uid;
  final int? lastUpdated;
  final String? username;
  final String? firstname;
  final String? lastname;
  final bool? isFollowed;
  final bool? isFy;
  final String? image;
  final int? share;
  final List<SongDetails> songs;
  final String? type;
  final int? listCount;
  final int? fanCount;
  final String? h2;
  final bool? isDolbyPlaylist;
  final String? subheading;
  final bool? videoAvailable;

  factory PlaylistDetails.fromJson(Map<String, dynamic> json) =>
      PlaylistDetails(
        listid: json['listid'] == null ? null : int.parse(json['listid']),
        listname: json['listname'],
        permaUrl: json['perma_url'],
        followerCount: json['follower_count'] == null
            ? null
            : int.parse(json['follower_count']),
        uid: json['uid'],
        lastUpdated: json['last_updated'] == null
            ? null
            : int.parse(json['last_updated']),
        username: json['username'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        isFollowed: json['is_followed'],
        isFy: json['isFY'],
        image: json['image'],
        share: json['share'] == null ? null : int.parse(json['share']),
        songs: List<SongDetails>.from(
          json['songs'].map((x) => SongDetails.fromJson(x)),
          growable: false,
        ),
        type: json['type'],
        listCount:
            json['list_count'] == null ? null : int.parse(json['list_count']),
        fanCount: json['fan_count'],
        h2: json['H2'],
        isDolbyPlaylist: json['is_dolby_playlist'],
        subheading: json['subheading'],
        videoAvailable: json['video_available'],
      );

  Map<String, dynamic> toJson() => {
        'listid': listid,
        'listname': listname,
        'perma_url': permaUrl,
        'follower_count': followerCount,
        'uid': uid,
        'last_updated': lastUpdated,
        'username': username,
        'firstname': firstname,
        'lastname': lastname,
        'is_followed': isFollowed,
        'isFY': isFy,
        'image': image,
        'share': share,
        'songs': List.from(songs.map((x) => x.toJson())),
        'type': type,
        'list_count': listCount,
        'fan_count': fanCount,
        'H2': h2,
        'is_dolby_playlist': isDolbyPlaylist,
        'subheading': subheading,
        'video_available': videoAvailable,
      };
}
