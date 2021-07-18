import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';

class PlaylistsPage extends StatefulWidget {
  const PlaylistsPage();

  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  String currentSort = 'Sort by 0';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: Assets.icons.lookingAtVoid.svg(),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              L10n.of(context)!.noPlaylistsFound,
            ),
          ),
        ],
      ),
    );
  }
}
