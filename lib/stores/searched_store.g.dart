// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchedStore on _SearchedStore, Store {
  final _$playlistsAtom = Atom(name: '_SearchedStore.playlists');

  @override
  ObservableList<Playlist> get playlists {
    _$playlistsAtom.reportRead();
    return super.playlists;
  }

  @override
  set playlists(ObservableList<Playlist> value) {
    _$playlistsAtom.reportWrite(value, super.playlists, () {
      super.playlists = value;
    });
  }

  final _$fetchingAtom = Atom(name: '_SearchedStore.fetching');

  @override
  bool get fetching {
    _$fetchingAtom.reportRead();
    return super.fetching;
  }

  @override
  set fetching(bool value) {
    _$fetchingAtom.reportWrite(value, super.fetching, () {
      super.fetching = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_SearchedStore.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$searchForPlaylistsAsyncAction =
      AsyncAction('_SearchedStore.searchForPlaylists');

  @override
  Future<void> searchForPlaylists(String searchPhrase) {
    return _$searchForPlaylistsAsyncAction
        .run(() => super.searchForPlaylists(searchPhrase));
  }

  @override
  String toString() {
    return '''
playlists: ${playlists},
fetching: ${fetching},
errorMessage: ${errorMessage}
    ''';
  }
}
