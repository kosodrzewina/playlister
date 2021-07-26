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

  final _$addPlaylistsByChannelIdAsyncAction =
      AsyncAction('_PlaylistStore.addPlaylistsByChannelId');

  @override
  Future<void> addPlaylistsByChannelId(String apiKey, String channelId) {
    return _$addPlaylistsByChannelIdAsyncAction
        .run(() => super.addPlaylistsByChannelId(apiKey, channelId));
  }

  final _$_PlaylistStoreActionController =
      ActionController(name: '_PlaylistStore');

  @override
  void setPlaylistsByJson(String playlistsJson) {
    final _$actionInfo = _$_PlaylistStoreActionController.startAction(
        name: '_PlaylistStore.setPlaylistsByJson');
    try {
      return super.setPlaylistsByJson(playlistsJson);
    } finally {
      _$_PlaylistStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playlists: ${playlists}
    ''';
  }
}
