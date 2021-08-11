import 'dart:convert';

import 'package:http/http.dart';

import '../models.dart';
import '../stores/auth_store.dart';

extension on Response {
  bool get ok => statusCode >= 200 && statusCode < 300;
}

class YoutubeRepository {
  static final baseUri = Uri.parse('https://www.googleapis.com/youtube/v3');

  final AuthStore _authStore;

  const YoutubeRepository(this._authStore);

  Future<List<Playlist>?> searchedPlaylists(String searchPhrase) async {
    final apiKey = _authStore.apiKey;

    if (apiKey == null) {
      return null;
    }

    final url = baseUri.replace(
      path: '${baseUri.path}/search',
      queryParameters: <String, String>{
        'key': apiKey,
        // 'maxResults': '50',
        'type': 'playlist',
        'q': searchPhrase,
      },
    );
    var response = await get(url);

    if (!response.ok) {
      return null;
    }

    var responseDeserialized = YTSearchListResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );

    final ids = responseDeserialized.items
        .where((i) => i.id.playlistId != null)
        .map((i) => i.id.playlistId ?? '')
        .toList();

    // while (responseDeserialized.nextPageToken != null) {
    //   response = await get(
    //     url.replace(
    //       queryParameters: <String, String>{
    //         ...url.queryParameters,
    //         'pageToken': responseDeserialized.nextPageToken!,
    //       },
    //     ),
    //   );
    //   responseDeserialized = YTSearchListResponse.fromJson(
    //     jsonDecode(response.body) as Map<String, dynamic>,
    //   );
    //   ids.addAll(responseDeserialized.items
    //       .where((i) => i.id.playlistId != null)
    //       .map((i) => i.id.playlistId ?? ''));
    // }

    return playlistByPlaylistId(ids);
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
