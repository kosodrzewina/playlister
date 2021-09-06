import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../models.dart';
import '../widgets/playlists_list_item.dart';

class PlaylistItemPage extends StatelessWidget {
  final String title;
  final List<PlaylistItem>? items;

  const PlaylistItemPage({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: items != null
          ? ListView.separated(
              itemCount: items!.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = items![index];

                return PlaylistsListItem(snippet: item.snippet);
                // return PlaylistsListItem(snippet: item.snippet);
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.lookingAtVoid.svg(
                    height: 250,
                    width: 250,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    L10n.of(context)!.playlistItemPage_howEmpty,
                  ),
                ],
              ),
            ),
    );
  }
}
