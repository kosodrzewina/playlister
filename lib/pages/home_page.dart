import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../stores/playlist_store.dart';
import '../widgets/playlists_list_item.dart';
import '../widgets/recently_updated_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    if (context.read<PlaylistStore>().playlists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Assets.icons.lookingAtVoid.svg(
                height: 250,
                width: 250,
              ),
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              L10n.of(context)!.homePage_recentlyUpdated,
            ),
          ],
        ),
        SizedBox(
          height: 150,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 10),
              for (var item in context.read<PlaylistStore>().playlists) ...[
                if (item.snippet!.thumbnails.default_ != null &&
                    !item.snippet!.thumbnails.default_!.url
                        .contains('no_thumbnail'))
                  RecentlyUpdatedListItem(
                    text: item.snippet!.title,
                    color: Colors.red,
                  )
                else
                  RecentlyUpdatedListItem(
                    text: item.snippet!.title,
                    color: Colors.amber,
                  ),
                const SizedBox(width: 10),
              ]
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              L10n.of(context)!.homePage_recentlyAdded,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            shrinkWrap: true,
            children: [
              for (var item in context.read<PlaylistStore>().playlists) ...[
                if (item.snippet!.thumbnails.default_ != null &&
                    !item.snippet!.thumbnails.default_!.url
                        .contains('no_thumbnail'))
                  PlaylistsListItem(
                    text: item.snippet!.title,
                    image: NetworkImage(item.snippet!.thumbnails.default_!.url),
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
