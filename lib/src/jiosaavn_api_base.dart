import 'package:jiosaavn_api/src/models/playlist.dart';

import 'helpers/uri_builder.dart';
import 'models/album.dart';
import 'models/search_result.dart';
import 'models/song.dart';
import 'services/api_client.dart';

class JioSaavn {
  final _apiClient = ApiClient();
  bool get isAwesome => true;

  Future<SearchResult> search(String query, lyrics) async {
    final searchRes = await _apiClient.requestGetJson(buildSearchUri(query));

    return SearchResult.fromJson(searchRes);
  }

  Future<String> getSongId(String url) async {
    final song = await _apiClient.requestGetRaw(Uri.parse(url));

    print(song.split('"song":{"type":"')[1].split('","image":').first);

    return song
        .split('"song":{"type":"')[1]
        .split('","image":')
        .first
        .split('"id":"')
        .last;
  }

  Future<List<SongDetails>> getSongs(List<String> ids, lyrics) async {
    final songsRes = await _apiClient.requestGetJson(buildSongIdUri(ids));

    return List.from(ids.map((id) => SongDetails.fromJson(songsRes[id])));
  }

  Future<AlbumDetails> getAlbum(String albumId, lyrics) async {
    final albumRes = await _apiClient.requestGetJson(buildAlbumIdUri(albumId));

    return AlbumDetails.fromJson(albumRes);
  }

  Future<PlaylistDetails> getPlaylist(String playlistId, lyrics) async {
    final playlistRes =
        await _apiClient.requestGetJson(buildPlaylistIdUri(playlistId));

    return PlaylistDetails.fromJson(playlistRes);
  }

  Future getLyrics(String lyricsId) async {
    final lyricsRes =
        await _apiClient.requestGetJson(buildLyricsIdUri(lyricsId));

    return lyricsRes;
  }
}
