Uri buildSearchUri(String query) => Uri.https('www.jiosaavn.com', '/api.php', {
      '__call': 'autocomplete.get',
      '_format': 'json',
      '_marker': '0',
      'cc': 'in',
      'includeMetaTags': '1',
      'query': query,
    });

Uri buildSongIdUri(List<String> ids) =>
    Uri.https('www.jiosaavn.com', '/api.php', {
      '__call': 'song.getDetails',
      '_format': 'json',
      '_marker': '0',
      'cc': 'in',
      'pids': ids.join(','),
    });

Uri buildAlbumIdUri(String id) => Uri.https('www.jiosaavn.com', '/api.php', {
      '__call': 'content.getAlbumDetails',
      '_format': 'json',
      '_marker': '0',
      'cc': 'in',
      'albumid': id,
    });

Uri buildPlaylistIdUri(String id) => Uri.https('www.jiosaavn.com', '/api.php', {
      '__call': 'playlist.getDetails',
      '_format': 'json',
      '_marker': '0',
      'cc': 'in',
      'listid': id,
    });

Uri buildLyricsIdUri(String id) => Uri.https('www.jiosaavn.com', '/api.php', {
      '__call': 'lyrics.getLyrics',
      'ctx': 'web6dot0',
      'api_version': '4',
      '_format': 'json',
      '_marker': '0',
      'cc': 'in',
      'lyrics_id': id,
    });
