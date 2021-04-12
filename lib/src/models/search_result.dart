import 'album.dart';
import 'json_model.dart';
import 'playlist.dart';
import 'song.dart';

class SearchResult {
  SearchResult({
    this.albums = const SearchData<Album>(),
    this.songs = const SearchData<Song>(),
    this.playlists = const SearchData<Playlist>(),
    this.artists = const SearchData(),
    this.topquery = const SearchData(),
    this.shows = const SearchData(),
    this.episodes = const SearchData(),
  });

  final SearchData<Album> albums;
  final SearchData<Song> songs;
  final SearchData<Playlist> playlists;
  final SearchData artists;
  final SearchData topquery;
  final SearchData shows;
  final SearchData episodes;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        albums: SearchData.fromJson(
          json['albums'],
          (data) => Album.fromJson(data),
        ),
        songs: SearchData.fromJson(
          json['songs'],
          (data) => Song.fromJson(data),
        ),
        playlists: SearchData.fromJson(
          json['playlists'],
          (data) => Playlist.fromJson(data),
        ),
        artists: SearchData.fromJson(
          json['artists'],
          (data) => JsonMapModel.fromJson(data),
        ),
        topquery: SearchData.fromJson(
          json['topquery'],
          (data) => JsonMapModel.fromJson(data),
        ),
        shows: SearchData.fromJson(
          json['shows'],
          (data) => JsonMapModel.fromJson(data),
        ),
        episodes: SearchData.fromJson(
          json['episodes'],
          (data) => JsonMapModel.fromJson(data),
        ),
      );

  Map<String, dynamic> toJson() => {
        'albums': albums.toJson(),
        'songs': songs.toJson(),
        'playlists': playlists.toJson(),
        'artists': artists.toJson(),
        'topquery': topquery.toJson(),
        'shows': shows.toJson(),
        'episodes': episodes.toJson(),
      };
}

class SearchData<T extends JsonModel> {
  const SearchData({
    this.data = const [],
    this.position,
  });

  final List<T> data;
  final int? position;

  factory SearchData.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> data) builder,
  ) =>
      SearchData(
        data: List<T>.from(json['data'].map((x) => builder(x))),
        position: json['position'],
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'position': position,
      };
}
