import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../stores/searched_store.dart';
import '../widgets/playlists_list_item.dart';
import '../widgets/search_field.dart';
import '../widgets/text_button_icon.dart';
import 'channel_id_dialog.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final searchedPlaylists = context.watch<SearchedStore>().playlists;

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: SearchField(
                labelText: L10n.of(context)!.searchPage_searchForPlaylists,
                accentColor: Colors.red,
                onSubmitted: (searchPhrase) {
                  context
                      .read<SearchedStore>()
                      .searchForPlaylists(searchPhrase);
                },
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButtonIcon(
              icon: const Icon(Icons.add),
              text: L10n.of(context)!.searchPage_addByChannelId,
              onPressed: () async => await showChannelIdDialog(context),
            ),
          ],
        ),
        Observer(
          builder: (_) => Expanded(
            child: ListView.separated(
              itemCount: searchedPlaylists.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = searchedPlaylists[index];

                return PlaylistsListItem(
                  text: item.snippet!.title,
                  image: Image.network(
                    item.snippet!.thumbnails.default_?.url ??
                        item.snippet!.thumbnails.standard?.url ??
                        '',
                    errorBuilder: (context, err, st) =>
                        Assets.images.noThumbnail.image(
                      fit: BoxFit.cover,
                      width: 62,
                      height: 50,
                    ),
                    fit: BoxFit.cover,
                    width: 62,
                    height: 50,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
