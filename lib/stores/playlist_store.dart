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
  static const endangeredPlaylistsKey = 'ENDANGERED_PLAYLISTS';

  late ReactionDisposer _saveDisposerPlaylists;
  late ReactionDisposer _saveDisposerEndangeredPlaylists;
  final YoutubeRepository _youtubeRepository;

  @observable
  ObservableList<Playlist> playlists = ObservableList<Playlist>();

  @observable
  ObservableList<Playlist> endangeredPlaylists = ObservableList<Playlist>();

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
    final savedEndangeredPlaylists =
        jsonDecode(sharedPrefs.getString(endangeredPlaylistsKey) ?? '[]')
            as List<dynamic>;

    playlists.addAll(
      savedPlaylists.map(
        (dynamic item) => Playlist.fromJson(item as Map<String, dynamic>),
      ),
    );
    endangeredPlaylists.addAll(
      savedEndangeredPlaylists.map(
        (dynamic item) => Playlist.fromJson(item as Map<String, dynamic>),
      ),
    );

    _saveDisposerPlaylists =
        reaction((_) => playlists.asObservable(), (_) async {
      await sharedPrefs.setString(
        playlistsKey,
        jsonEncode(playlists),
      );
    });
    _saveDisposerEndangeredPlaylists =
        reaction((_) => endangeredPlaylists.asObservable(), (_) async {
      await sharedPrefs.setString(
        endangeredPlaylistsKey,
        jsonEncode(endangeredPlaylists),
      );
    });
  }

  @action
  Future<void> addEndangeredPlaylists() async {
    infoMessage = null;

    final endangeredPlaylists = <Playlist>[];

    for (final playlist in playlists) {
      final res = await _youtubeRepository.playlistByPlaylistId({playlist.id});

      if (res == null) {
        continue;
      }

      final currentPlaylist = res.first.copyWith(
          items: await _youtubeRepository
              .allPlaylistItemsByPlaylistId(res.first.id));

      addNewVideos(currentPlaylist);

      final endangeredVideos = playlist.getEndangeredVideos(currentPlaylist);

      if (endangeredVideos != null && endangeredVideos.isNotEmpty) {
        endangeredPlaylists.add(
          currentPlaylist.copyWith(items: endangeredVideos),
        );
      }
    }

    final ids = this.endangeredPlaylists.map((ep) => ep.id);
    final newEndangeredPlaylists = endangeredPlaylists.where(
      (ep) => !ids.contains(ep.id),
    );

    if (newEndangeredPlaylists.isEmpty) {
      infoMessage = L10nStrings.info_noChangesFound;
      return;
    }

    this.endangeredPlaylists.addAll(newEndangeredPlaylists);
  }

  @action
  void addNewVideos(Playlist playlist) {
    final storedVideos = playlists.firstWhere((p) => p.id == playlist.id).items;

    final newVideos = playlist.items;
    if (newVideos == null) {
      return;
    }

    for (final nv in newVideos) {
      try {
        storedVideos!.singleWhere((sv) => sv.id == nv.id);
        // ignore: avoid_catching_errors
      } on StateError {
        playlists
          ..removeWhere((p) => p.id == playlist.id)
          ..add(playlist);
      }
    }
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
    endangeredPlaylists.removeWhere((ep) => ep.id == id);
    successMessage = L10nStrings.success_playlistRemoved;
  }

  void dispose() {
    _saveDisposerPlaylists();
    _saveDisposerEndangeredPlaylists();
  }
}
