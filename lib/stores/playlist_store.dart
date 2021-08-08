import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/l10n.dart';
import '../models.dart';
import '../repositories/youtube_repository.dart';

part 'playlist_store.g.dart';

class PlaylistStore = _PlaylistStore with _$PlaylistStore;

abstract class _PlaylistStore with Store {
  static const playlistsKey = 'PLAYLISTS';

  final YoutubeRepository _youtubeRepository;

  @observable
  ObservableList<Playlist> playlists = ObservableList<Playlist>();

  @observable
  bool fetching = false;

  @observable
  String? errorMessage;

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
    fetching = true;

    try {
      final res = await _youtubeRepository.playlistsByChannelId(channelId);
      if (res == null) {
        errorMessage = L10nStrings.error_fetchingPlaylists;
      } else {
        final ids = playlists.map((p) => p.id).toSet();
        playlists.addAll(res.where((p) => !ids.contains(p.id)));
      }
    } on SocketException {
      errorMessage = L10nStrings.error_noInternet;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      errorMessage = L10nStrings.error_unknown;
    } finally {
      fetching = false;
    }
  }
}
