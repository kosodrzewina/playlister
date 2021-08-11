import 'dart:io';

import 'package:mobx/mobx.dart';

import '../l10n/l10n.dart';
import '../models.dart';
import '../repositories/youtube_repository.dart';

part 'searched_store.g.dart';

class SearchedStore = _SearchedStore with _$SearchedStore;

abstract class _SearchedStore with Store {
  final YoutubeRepository _youtubeRepository;

  @observable
  ObservableList<Playlist> playlists = ObservableList<Playlist>();

  @observable
  bool fetching = false;

  @observable
  String? errorMessage;

  _SearchedStore({
    required YoutubeRepository youtubeRepository,
  }) : _youtubeRepository = youtubeRepository;

  @action
  Future<void> searchForPlaylists(String searchPhrase) async {
    fetching = true;

    try {
      final res = await _youtubeRepository.searchedPlaylists(searchPhrase);

      if (res == null) {
        errorMessage = L10nStrings.error_fetchingPlaylists;
      } else {
        playlists.clear();
        // ignore: cascade_invocations
        playlists.addAll(res);
      }
    } on SocketException {
      errorMessage = L10nStrings.error_noInternet;
      // ignore: avoid_catches_without_on_clauses
    } finally {
      fetching = false;
    }
  }
}
