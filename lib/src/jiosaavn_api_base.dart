import 'helpers/formatter.dart';
import 'helpers/uri_builder.dart';
import 'models/album.dart';
import 'models/autocomplete_result.dart';
import 'models/launch_data.dart';
import 'models/lyrics.dart';
import 'models/playlist.dart';
import 'models/song.dart';
import 'models/top_search.dart';
import 'services/api_client.dart';

class JioSaavn {
  final _apiClient = ApiClient();

  Future<LaunchData> getLaunchData() async {
    final data = await _apiClient.requestGetJson(launchDataUrl);

    return LaunchData.fromJson(data);
  }

  Future<AutocompleteResult> searchAutocomplete(String query) async {
    final searchRes =
        await _apiClient.requestGetJson(buildAutocompleteUri(query));

    return AutocompleteResult.fromJson(searchRes);
  }

  Future<List<TopSearchItem>> getTopSearches() async {
    final res = await _apiClient.requestGetListJson(topSearchUri);

    return TopSearchItem.fromList(res);
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

    return (songsRes['songs'] as List)
        .map((song) => SongDetails.fromJson(formatSongJson(song)))
        .toList(growable: false);
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

  void close() => _apiClient.close();
}
