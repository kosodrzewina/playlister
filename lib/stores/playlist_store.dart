import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models.dart';

part 'playlist_store.g.dart';

class PlaylistStore = _PlaylistStore with _$PlaylistStore;

abstract class _PlaylistStore with Store {
  static const playlistsKey = 'PLAYLISTS';

  _PlaylistStore() {
    reaction((_) => playlists, (playlists) async {
      final sharedPrefs = await SharedPreferences.getInstance();

      if (playlists == null) {
        await sharedPrefs.remove(playlistsKey);
      } else {
        await sharedPrefs.setString(
          playlistsKey,
          jsonEncode(this.playlists),
        );
      }
    });
  }

  Future<void> initialize() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    if (sharedPrefs.getString(playlistsKey) != null) {
      setPlaylistsByJson(sharedPrefs.getString(playlistsKey)!);
    }
  }

  @observable
  ObservableList<Playlist>? playlists;

  @action
  void setPlaylistsByJson(String playlistsJson) {
    for (final item in jsonDecode(playlistsJson)) {
      playlists?.add(item as Playlist);
    }
  }

  @action
  Future<void> setPlaylistsByChannelId(String apiKey, String channelId) async {
    var response = await get(Uri.parse(
        'https://www.googleapis.com/youtube/v3/playlists?part=snippet&maxResults=50&channelId=$channelId&key=$apiKey'));
    var responseDeserialized = YTResponsePlaylistList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);

    playlists = ObservableList<Playlist>();

    for (final item in responseDeserialized.items) {
      playlists?.add(item);
    }

    while (responseDeserialized.nextPageToken != null) {
      response = await get(Uri.parse(
          'https://www.googleapis.com/youtube/v3/playlists?part=snippet&maxResults=50&pageToken=${responseDeserialized.nextPageToken}&channelId=$channelId&key=$apiKey'));
      responseDeserialized = YTResponsePlaylistList.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      for (final item in responseDeserialized.items) {
        playlists?.add(item);
      }
    }
  }
}
