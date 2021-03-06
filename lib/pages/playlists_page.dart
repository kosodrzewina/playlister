import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../stores/playlist_store.dart';
import '../widgets/playlists_list_item.dart';
import 'playlist_item_page.dart';

class PlaylistsPage extends StatefulWidget {
  const PlaylistsPage();

  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  String currentSort = 'Sort by 0';

  @override
  Widget build(BuildContext context) {
    final playlists = context.watch<PlaylistStore>().playlists;

    return Observer(builder: (_) {
      playlists.sort();

      return playlists.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.lookingAtVoid.svg(
                    height: 250,
                    width: 250,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    L10n.of(context)!.noPlaylistsFound,
                  ),
                ],
              ),
            )
          : Observer(
              builder: (_) => ListView.separated(
                itemCount: playlists.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = playlists[index];

                  return PlaylistsListItem(
                    snippet: item.snippet!,
                    icon: const Icon(Icons.delete),
                    onPressedIcon: () => context
                        .read<PlaylistStore>()
                        .removePlaylistById(item.id),
                    onTap: () => Navigator.of(context).push(
                      PlaylistItemPageRoute(
                        id: item.id,
                        title: item.snippet!.title,
                        items: item.items,
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
