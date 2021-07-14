import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../widgets/playlists_list_item.dart';
import '../widgets/recently_updated_list_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            children: const [
              SizedBox(
                width: 10,
              ),
              RecentlyUpdatedListItem(
                text: 'Playlist name',
                color: Colors.red,
              ),
              SizedBox(width: 10),
              RecentlyUpdatedListItem(
                text: 'Playlist name',
                color: Colors.teal,
              ),
              SizedBox(width: 10),
              RecentlyUpdatedListItem(
                text: 'Playlist name',
                color: Colors.amber,
              ),
              SizedBox(width: 10),
              RecentlyUpdatedListItem(
                text: 'Playlist name',
                color: Colors.purpleAccent,
              ),
              SizedBox(
                width: 10,
              ),
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
            children: const [
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.teal,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.red,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.purple,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.yellow,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.red,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.teal,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
