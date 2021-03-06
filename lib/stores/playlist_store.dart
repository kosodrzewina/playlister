import 'dart:async';
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

  late ReactionDisposer _saveDisposer;
  final YoutubeRepository _youtubeRepository;

  @observable
  ObservableList<Playlist> playlists = ObservableList<Playlist>();

  @observable
  bool fetching = false;

  @observable
  String? errorMessage;

  @observable
  String? infoMessage;

  @observable
  String? successMessage;

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

    _saveDisposer = reaction((_) => playlists.asObservable(), (_) async {
      await sharedPrefs.setString(
        playlistsKey,
        jsonEncode(playlists),
      );
    });
  }

  @action
  Future<void> addPlaylistsByChannelId(String channelId) async {
    infoMessage = null;
    errorMessage = null;
    successMessage = null;
    fetching = true;

    try {
      final res = await _youtubeRepository.playlistsByChannelId(channelId);
      if (res == null) {
        errorMessage = L10nStrings.error_fetchingPlaylists;
      } else {
        final ids = playlists.map((p) => p.id).toSet();
        playlists.addAll(
          await Future.wait(
            res.where((p) => !ids.contains(p.id)).map(
                  (p) async => p.copyWith(
                    items: await _youtubeRepository
                        .allPlaylistItemsByPlaylistId(p.id),
                  ),
                ),
          ),
        );
        successMessage = L10nStrings.success_playlistsAdded;
      }
    } on SocketException {
      errorMessage = L10nStrings.error_noInternet;
    } catch (e) {
      errorMessage = L10nStrings.error_unknown;
    } finally {
      fetching = false;
    }
  }

  @action
  Future<void> addPlaylistById(String id) async {
    infoMessage = null;
    errorMessage = null;
    successMessage = null;
    fetching = true;

    try {
      if (playlists.any((p) => p.id == id)) {
        infoMessage = L10nStrings.info_alreadyAdded;
        return;
      }

      final res = await _youtubeRepository.playlistByPlaylistId({id});

      if (res == null) {
        errorMessage = L10nStrings.error_fetchingPlaylists;
      } else {
        playlists.add(
          res.single.copyWith(
            items: await _youtubeRepository
                .allPlaylistItemsByPlaylistId(res.single.id),
          ),
        );

        successMessage = L10nStrings.success_playlistAdded;
      }
    } on SocketException {
      errorMessage = L10nStrings.error_noInternet;
    } catch (e) {
      errorMessage = L10nStrings.error_unknown;
    } finally {
      fetching = false;
    }
  }

  @action
  void removePlaylistById(String id) {
    successMessage = null;
    playlists.removeWhere((p) => p.id == id);
    successMessage = L10nStrings.success_playlistRemoved;
  }

  void dispose() {
    _saveDisposer();
  }
}
