import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:playlister/widgets/app_snack_bar.dart';
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
    final playlists = context.watch<PlaylistStore>().playlists;

    if (playlists.isEmpty) {
      return Center(
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
        Observer(
          builder: (_) => Expanded(
            child: ListView.separated(
              itemCount: playlists.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = playlists[index];

                return PlaylistsListItem(
                    snippet: item.snippet!,
                    icon: const Icon(Icons.delete),
                    onTapIcon: () {
                      context.read<PlaylistStore>().removePlaylistById(item.id);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          AppSnackBar.success(
                            content:
                                Text(L10n.of(context)!.success_playlistRemoved),
                          ),
                        );
                    });
              },
            ),
          ),
        ),
      ],
    );
  }
}
