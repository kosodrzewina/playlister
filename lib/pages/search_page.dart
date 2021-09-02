import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import '../stores/auth_store.dart';
import '../widgets/icon_text_button.dart';
import '../widgets/search_field.dart';
import '../widgets/search_list_view.dart';
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
        Observer(
          builder: (_) => IconTextButton(
            icon: context.read<AuthStore>().apiKey != null
                ? const Icon(Icons.add)
                : Icon(
                    Icons.add,
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
                  ),
            text: context.read<AuthStore>().apiKey != null
                ? Text(L10n.of(context)!.searchPage_addByChannelId)
                : Text(
                    L10n.of(context)!.searchPage_addByChannelId,
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.3),
                    ),
                  ),
            onPressed: context.read<AuthStore>().apiKey != null
                ? () async => await showChannelIdDialog(context)
                : null,
          ),
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
