import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../widgets/options_list_item.dart';

Future<void> showProfileDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
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
                    const Text(
                      'Not logged in',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const OptionsListItem(
                  icon: Icon(Icons.login),
                  text: 'Log in',
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    OptionsListItem(
                      icon: Icon(Icons.vpn_key),
                      text: 'Enter API key',
                    ),
                    SizedBox(width: 20)
                  ],
                ),
                const SizedBox(height: 20),
                const OptionsListItem(
                  icon: Icon(Icons.help),
                  text: 'Help',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      );
    },
  );
}
