import 'dart:convert';

import 'package:http/http.dart';

import '../models.dart';
import '../stores/auth_store.dart';

class YoutubeRepository {
  static final baseUri = Uri.parse('https://www.googleapis.com/youtube/v3');

  final AuthStore _authStore;

  const YoutubeRepository(this._authStore);

  Future<List<Playlist>?> playlistsByChannelId(String channelId) async {
    final apiKey = _authStore.apiKey;
    if (apiKey == null) return null;
    final url = baseUri.replace(
      path: '${baseUri.path}/playlists',
      queryParameters: <String, String>{
        'part': 'snippet',
        'maxResults': '50',
        'channelId': channelId,
        'key': apiKey,
      },
    );

    final playlists = <Playlist>[];

    var response = await get(url);
    var responseDeserialized = YTResponsePlaylistList.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );

    playlists.addAll(responseDeserialized.items);

    while (responseDeserialized.nextPageToken != null) {
      response = await get(
        url.replace(
          queryParameters: <String, String>{
            ...url.queryParameters,
            'pageToken': responseDeserialized.nextPageToken!,
          },
        ),
      );
      responseDeserialized = YTResponsePlaylistList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );

      playlists.addAll(responseDeserialized.items);
    }

    return playlists;
  }
}
