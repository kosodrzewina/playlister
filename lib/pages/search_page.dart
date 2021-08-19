import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
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
  String? searchTerm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SearchField(
            labelText: L10n.of(context)!.searchPage_searchForPlaylists,
            accentColor: Theme.of(context).accentColor,
            onSubmitted: (searchTerm) {
              setState(() =>
                  this.searchTerm = searchTerm.isEmpty ? null : searchTerm);
            },
          ),
        ),
        IconTextButton(
          icon: const Icon(Icons.add),
          text: L10n.of(context)!.searchPage_addByChannelId,
          matchParent: false,
          onPressed: () async => await showChannelIdDialog(context),
        ),
        Expanded(
          child: SearchListView(
            searchTerm: searchTerm,
            key: ValueKey(searchTerm),
          ),
        ),
      ],
    );
  }
}
