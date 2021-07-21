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
          jsonEncode(this.playlists?.toJson()),
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
  YTResponsePlaylistList? playlists;

  // ignore: use_setters_to_change_properties
  @action
  void setPlaylistsByJson(String playlistsJson) {
    playlists = YTResponsePlaylistList.fromJson(
        jsonDecode(playlistsJson) as Map<String, dynamic>);
  }

  @action
  // ignore: avoid_void_async
  Future<void> setPlaylistsByChannelId(String apiKey, String channelId) async {
    final response = await get(Uri.parse(
        'https://www.googleapis.com/youtube/v3/playlists?part=snippet&maxResults=50&channelId=$channelId&key=$apiKey'));
    playlists = YTResponsePlaylistList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
