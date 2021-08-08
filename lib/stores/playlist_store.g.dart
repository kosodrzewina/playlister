// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaylistStore on _PlaylistStore, Store {
  final _$playlistsAtom = Atom(name: '_PlaylistStore.playlists');

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

  final _$fetchingAtom = Atom(name: '_PlaylistStore.fetching');

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

  final _$errorMessageAtom = Atom(name: '_PlaylistStore.errorMessage');

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

  final _$addPlaylistsByChannelIdAsyncAction =
      AsyncAction('_PlaylistStore.addPlaylistsByChannelId');

  @override
  Future<void> addPlaylistsByChannelId(String channelId) {
    return _$addPlaylistsByChannelIdAsyncAction
        .run(() => super.addPlaylistsByChannelId(channelId));
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
