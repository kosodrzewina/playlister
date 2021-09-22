import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playlister/widgets/icon_text_button.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../stores/playlist_store.dart';

class EndangeredPage extends StatelessWidget {
  const EndangeredPage();

  @override
  Widget build(BuildContext context) {
    final _playlistStore = context.read<PlaylistStore>();

    return Column(
      children: [
        IconTextButton(
          icon: const Icon(Icons.ac_unit),
          child: const Text('check'),
          onPressed: () {
            _playlistStore.addEndangeredPlaylists();

            if (_playlistStore.endangeredPlaylists.isEmpty) {
              print('no changes found');
              return;
            }

            final snippet = _playlistStore.endangeredPlaylists.first.snippet;
            print(snippet != null ? snippet.title : 'something went wrong');
          },
        ),
        RefreshIndicator(
          onRefresh: () => Future.delayed(Duration.zero),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.secure.svg(
                    height: 250,
                    width: 250,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    L10n.of(context)!.endangeredPage_noDeletedVideosDetected,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
