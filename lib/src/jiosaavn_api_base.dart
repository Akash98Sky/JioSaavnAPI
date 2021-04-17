import 'helpers/formatter.dart';
import 'helpers/uri_builder.dart';
import 'models/album.dart';
import 'models/lyrics.dart';
import 'models/playlist.dart';
import 'models/search_result.dart';
import 'models/song.dart';
import 'services/api_client.dart';

class JioSaavn {
  final _apiClient = ApiClient();

  Future<SearchResult> search(String query) async {
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

  Future<List<SongDetails>> getSongs(List<String> ids) async {
    final songsRes = await _apiClient.requestGetJson(buildSongIdUri(ids));

    return List.from(
        ids.map((id) => SongDetails.fromJson(formatSongJson(songsRes[id]))));
  }

  Future<AlbumDetails> getAlbum(String albumId) async {
    final albumRes = await _apiClient.requestGetJson(buildAlbumIdUri(albumId));

    return AlbumDetails.fromJson(formatAlbumJson(albumRes));
  }

  Future<PlaylistDetails> getPlaylist(String playlistId) async {
    final playlistRes =
        await _apiClient.requestGetJson(buildPlaylistIdUri(playlistId));

    return PlaylistDetails.fromJson(formatPlaylistJson(playlistRes));
  }

  Future<Lyrics> getLyrics(String lyricsId) async {
    final lyricsRes =
        await _apiClient.requestGetJson(buildLyricsIdUri(lyricsId));

    return Lyrics.fromJson(lyricsRes);
  }
}
