import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../stores/playlist_store.dart';
import '../widgets/icon_text_button.dart';
import '../widgets/playlists_list_item.dart';
import 'playlist_item_page.dart';

class EndangeredPage extends StatefulWidget {
  const EndangeredPage();

  @override
  State<EndangeredPage> createState() => _EndangeredPageState();
}

class _EndangeredPageState extends State<EndangeredPage> {
  @override
  Widget build(BuildContext context) {
    final endangeredPlaylists =
        context.read<PlaylistStore>().endangeredPlaylists;
    final _playlistStore = context.read<PlaylistStore>();

    return Observer(builder: (_) {
      endangeredPlaylists.sort();

      return endangeredPlaylists.isEmpty
          ? Column(
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

                    final snippet =
                        _playlistStore.endangeredPlaylists.first.snippet;
                    print(snippet != null
                        ? snippet.title
                        : 'something went wrong');
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
                            L10n.of(context)!
                                .endangeredPage_noDeletedVideosDetected,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Observer(
              builder: (_) => ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: endangeredPlaylists.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = endangeredPlaylists[index];

                  return PlaylistsListItem(
                    snippet: item.snippet!,
                    color: Colors.deepOrange,
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
