import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../widgets/options_list_item.dart';
import 'api_key_dialog.dart';

class ProfileDialog extends StatefulWidget {
  @override
  _ProfileDialogState createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  bool loggedIn = false;
  String logText = L10nStrings.profileDialog_logIn;
  Icon logIcon = const Icon(Icons.login);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: Assets.images.avatar,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    L10n.of(context)!.profileDialog_notLoggedIn,
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              OptionsListItem(
                icon: logIcon,
                text: logText.tr(context),
                onTap: () {
                  setState(() {
                    loggedIn = !loggedIn;

                    logText = loggedIn
                        ? L10n.of(context)!.profileDialog_logOut
                        : L10n.of(context)!.profileDialog_logIn;
                    logIcon = Icon(loggedIn ? Icons.logout : Icons.login);
                  });
                },
              ),
              OptionsListItem(
                icon: const Icon(Icons.vpn_key),
                text: L10n.of(context)!.profileDialog_enterApiKey,
                onTap: () async {
                  await showApiKeyDialog(context);
                },
              ),
              OptionsListItem(
                icon: const Icon(Icons.help),
                text: L10n.of(context)!.profileDialog_help,
                onTap: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> showProfileDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return ProfileDialog();
    },
  );
}
