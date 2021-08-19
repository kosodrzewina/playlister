import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import '../stores/playlist_store.dart';

class ChannelIdDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: L10n.of(context)!.channelIdDialog_channelId,
        ),
        onSubmitted: (channelId) {
          context.read<PlaylistStore>().addPlaylistsByChannelId(channelId);
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
    },
  );
}
