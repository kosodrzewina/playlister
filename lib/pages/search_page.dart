import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../widgets/search_field.dart';
import '../widgets/text_button_icon.dart';
import 'channel_id_dialog.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();

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
      ],
    );
  }
}
