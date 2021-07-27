import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.lookingAtVoid.svg(
            height: 250,
            width: 250,
          ),
          const SizedBox(height: 10),
          Text(
            L10n.of(context)!.noPlaylistsFound,
          ),
        ],
      ),
    );
  }
}
