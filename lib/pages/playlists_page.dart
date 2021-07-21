import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../stores/playlist_store.dart';
import '../widgets/playlists_list_item.dart';

class PlaylistsPage extends StatefulWidget {
  const PlaylistsPage();

  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  String currentSort = 'Sort by 0';

  @override
  Widget build(BuildContext context) {
    if (context.read<PlaylistStore>().playlists == null) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: DropdownButton<String>(
            value: currentSort,
            icon: const Icon(Icons.filter_list),
            items: [
              for (var item in ['Sort by 0', 'Sort by 1', 'Sort by 2'])
                DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ),
            ],
            onChanged: (value) {
              setState(() {
                currentSort = value!;
              });
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            shrinkWrap: true,
            children: [
              const SizedBox(height: 10),
              for (var item
                  in context.read<PlaylistStore>().playlists!.items) ...[
                if (!item.snippet!.thumbnails.default_.url
                    .contains('no_thumbnail'))
                  PlaylistsListItem(
                    text: item.snippet!.title,
                    image: NetworkImage(item.snippet!.thumbnails.default_.url),
                  )
                else
                  PlaylistsListItem(
                    text: item.snippet!.title,
                    image: Assets.images.noThumbnail,
                  ),
                const SizedBox(height: 10),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
