import 'json_model.dart';
import 'song.dart';

class Album extends JsonModel {
  Album({
    this.id,
    this.title,
    this.image,
    this.music,
    this.url,
    this.type,
    this.description,
    this.ctr,
    this.position,
    this.moreInfo = const AlbumInfo(),
  });

  final String? id;
  final String? title;
  final String? image;
  final String? music;
  final String? url;
  final String? type;
  final String? description;
  final int? ctr;
  final int? position;
  final AlbumInfo moreInfo;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        music: json['music'],
        url: json['url'],
        type: json['type'],
        description: json['description'],
        ctr: json['ctr'],
        position: json['position'],
        moreInfo: AlbumInfo.fromJson(json['more_info']),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'music': music,
        'url': url,
        'type': type,
        'description': description,
        'ctr': ctr,
        'position': position,
        'more_info': moreInfo.toJson(),
      };
}

class AlbumInfo {
  const AlbumInfo({
    this.year,
    this.isMovie,
    this.language,
    this.songPids,
  });

  final int? year;
  final String? isMovie;
  final String? language;
  final String? songPids;

  factory AlbumInfo.fromJson(Map<String, dynamic> json) => AlbumInfo(
        year: json['year'] == null ? null : int.parse(json['year']),
        isMovie: json['is_movie'],
        language: json['language'],
        songPids: json['song_pids'],
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'is_movie': isMovie,
        'language': language,
        'song_pids': songPids,
      };
}

class AlbumDetails {
  AlbumDetails({
    this.title,
    this.name,
    this.year,
    this.releaseDate,
    this.primaryArtists,
    this.primaryArtistsId,
    this.albumid,
    this.permaUrl,
    this.image,
    this.songs = const [],
  });

  final String? title;
  final String? name;
  final int? year;
  final DateTime? releaseDate;
  final List<String>? primaryArtists;
  final List<String>? primaryArtistsId;
  final String? albumid;
  final String? permaUrl;
  final String? image;
  final List<SongDetails> songs;

  factory AlbumDetails.fromJson(Map<String, dynamic> json) {
    return AlbumDetails(
      title: json['title'],
      name: json['name'],
      year: json['year'] == null ? null : int.parse(json['year']),
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date']),
      primaryArtists: json['primary_artists'] == null
          ? null
          : (json['primary_artists'] as String).split(', '),
      primaryArtistsId: json['primary_artists_id'] == null
          ? null
          : (json['primary_artists_id'] as String).split(', '),
      albumid: json['albumid'],
      permaUrl: json['perma_url'],
      image: json['image'],
      songs: List<SongDetails>.from(
        json['songs'].map((x) => SongDetails.fromJson(x)),
        growable: false,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'name': name,
        'year': year,
        'release_date': releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        'primary_artists': primaryArtists,
        'primary_artists_id': primaryArtistsId,
        'albumid': albumid,
        'perma_url': permaUrl,
        'image': image,
        'songs': List<dynamic>.from(songs.map((x) => x.toJson())),
      };
}
