import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/l10n.dart';
import '../repositories/youtube_repository.dart';
import '../stores/playlist_store.dart';

class ChannelIdDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: TextField(
        decoration: InputDecoration(
          labelText: L10n.of(context)!.channelIdDialog_channelId,
        ),
        onSubmitted: (channelId) {
          PlaylistStore(
            youtubeRepository: context.read<YoutubeRepository>(),
            sharedPrefs: context.read<SharedPreferences>(),
          ).addPlaylistsByChannelId(channelId);
          Navigator.pop(context);
        },
      ),
    );
  }
}

Future<void> showChannelIdDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return ChannelIdDialog();
      });
}
