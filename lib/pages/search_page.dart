import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
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
  ReactionDisposer? _reactionDisposer;
  final _controller = TextEditingController();
  String? searchTerm;

  @override
  void initState() {
    _reactionDisposer = autorun((_) {
      if (context.read<AuthStore>().apiKey == null) {
        _controller.clear();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Observer(builder: (_) {
            final isApiKey = context.read<AuthStore>().apiKey != null;

            return SearchField(
              isEnabled: isApiKey,
              controller: _controller,
              labelText: L10n.of(context)!.searchPage_searchForPlaylists,
              labelStyle: TextStyle(
                color: isApiKey
                    ? Theme.of(context).textTheme.bodyText1!.color!
                    : Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.3),
              ),
              icon: isApiKey
                  ? Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    )
                  : Icon(
                      Icons.search,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.3),
                    ),
              fillColor: isApiKey
                  ? Theme.of(context).cardColor
                  : Theme.of(context).cardColor.withOpacity(0.3),
              accentColor: Theme.of(context).accentColor,
              onSubmitted: (searchTerm) {
                setState(() =>
                    this.searchTerm = searchTerm.isEmpty ? null : searchTerm);
              },
            );
          }),
        ),
        Observer(builder: (_) {
          final isApiKey = context.read<AuthStore>().apiKey != null;

          return IconTextButton(
            icon: isApiKey
                ? const Icon(Icons.add)
                : Icon(
                    Icons.add,
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
                  ),
            onPressed: isApiKey ? () => showChannelIdDialog(context) : null,
            child: isApiKey
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
          );
        }),
        Expanded(
          child: SearchListView(
            searchTerm: searchTerm,
            key: ValueKey(searchTerm),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _reactionDisposer?.call();
    _controller.dispose();
    super.dispose();
  }
}
