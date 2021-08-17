import 'dart:convert';

import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

import '../models.dart';
import '../stores/auth_store.dart';

extension on Response {
  bool get ok => statusCode >= 200 && statusCode < 300;
}

class YoutubeRepository {
  static final baseUri = Uri.parse('https://www.googleapis.com/youtube/v3');

  final AuthStore _authStore;

  const YoutubeRepository(this._authStore);

  // item1: fetched playlists
  // item2: next page token
  Future<Tuple2<List<Playlist>?, String?>> searchedPlaylistsPage(
      String searchTerm, int itemCount,
      {String nextPageToken = ''}) async {
    if (itemCount < 1 || itemCount > 50) {
      return const Tuple2(null, null);
    }

    final apiKey = _authStore.apiKey;

    if (apiKey == null) {
      return const Tuple2(null, null);
    }

    final queryParameters = {
      'key': apiKey,
      'maxResults': itemCount.toString(),
      'type': 'playlist',
      'q': searchTerm,
    };

    if (nextPageToken.isNotEmpty) {
      queryParameters['pageToken'] = nextPageToken;
    }

    final url = baseUri.replace(
      path: '${baseUri.path}/search',
      queryParameters: queryParameters,
    );

    final response = await get(url);

    if (!response.ok) {
      return const Tuple2(null, null);
    }

    final responseDeserialized = YTSearchListResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );

    final ids = responseDeserialized.items
        .where((i) => i.id.playlistId != null)
        .map((i) => i.id.playlistId ?? '')
        .toList();

    return Tuple2(
      await playlistByPlaylistId(ids),
      responseDeserialized.nextPageToken,
    );
  }

  Future<List<Playlist>?> playlistByPlaylistId(List<String> playlistIds) async {
    final apiKey = _authStore.apiKey;
    if (apiKey == null) {
      return null;
    }

    final url = baseUri.replace(
      path: '${baseUri.path}/playlists',
      queryParameters: <String, String>{
        'part': 'snippet',
        'maxResults': '50',
        'key': apiKey,
        'id': playlistIds.join(','),
      },
    );

    final playlists = <Playlist>[];

    var response = await get(url);

    if (!response.ok) {
      return null;
    }

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

    if (!response.ok) {
      return null;
    }

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
