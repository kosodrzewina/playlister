import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import '../repositories/youtube_repository.dart';
import '../widgets/search_field.dart';
import '../widgets/search_list_view.dart';
import '../widgets/text_button_icon.dart';
import 'channel_id_dialog.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? searchPhrase;

  @override
  Widget build(BuildContext context) {
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
                  setState(() {
                    this.searchPhrase =
                        searchPhrase.isEmpty ? null : searchPhrase;
                  });
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
            child: SearchListView(
              searchPhrase: searchPhrase,
              youtubeRepository: context.read<YoutubeRepository>(),
            ),
          ),
        ),
      ],
    );
  }
}
