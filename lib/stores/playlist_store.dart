import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models.dart';
import '../repositories/youtube_repository.dart';

part 'playlist_store.g.dart';

class PlaylistStore = _PlaylistStore with _$PlaylistStore;

abstract class _PlaylistStore with Store {
  static const playlistsKey = 'PLAYLISTS';

  final YoutubeRepository _youtubeRepository;

  @observable
  ObservableList<Playlist> playlists = ObservableList<Playlist>();

  _PlaylistStore({
    required SharedPreferences sharedPrefs,
    required YoutubeRepository youtubeRepository,
  }) : _youtubeRepository = youtubeRepository {
    final savedPlaylists =
        jsonDecode(sharedPrefs.getString(playlistsKey) ?? '[]')
            as List<dynamic>;

    playlists.addAll(
      savedPlaylists.map(
        (dynamic item) => Playlist.fromJson(item as Map<String, dynamic>),
      ),
    );

    reaction((_) => playlists.asObservable(), (_) async {
      await sharedPrefs.setString(
        playlistsKey,
        jsonEncode(playlists),
      );
    });
  }

  @action
  Future<void> addPlaylistsByChannelId(String channelId) async {
    final res = await _youtubeRepository.playlistsByChannelId(channelId);
    if (res == null) {
      // TODO: handle failed request
      throw Exception('failed to fetch playlists');
    }

    playlists.addAll(res);
  }
}
