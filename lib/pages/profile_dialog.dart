import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../widgets/icon_text_button.dart';
import 'api_key_dialog.dart';

class ProfileDialog extends StatefulWidget {
  @override
  _ProfileDialogState createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  bool loggedIn = false;
  final profileScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: profileScaffoldMessengerKey,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () {},
            child: Dialog(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                        loggedIn
                            ? L10n.of(context)!.profileDialog_loggedInAs
                            : L10n.of(context)!.profileDialog_notLoggedIn,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  IconTextButton(
                    icon: Icon(loggedIn ? Icons.logout : Icons.login),
                    matchParent: true,
                    onPressed: () {
                      setState(() {
                        loggedIn = !loggedIn;
                      });
                    },
                    child: Text(
                      loggedIn
                          ? L10n.of(context)!.profileDialog_logOut
                          : L10n.of(context)!.profileDialog_logIn,
                    ),
                  ),
                  IconTextButton(
                    icon: const Icon(Icons.vpn_key),
                    matchParent: true,
                    onPressed: () async {
                      await showApiKeyDialog(
                        context,
                        profileScaffoldMessengerKey,
                      );
                    },
                    child: Text(L10n.of(context)!.profileDialog_enterApiKey),
                  ),
                  IconTextButton(
                    icon: const Icon(Icons.help),
                    matchParent: true,
                    onPressed: () {},
                    child: Text(L10n.of(context)!.profileDialog_help),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
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
