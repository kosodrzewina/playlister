import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../stores/playlist_store.dart';

class EndangeredPage extends StatelessWidget {
  const EndangeredPage();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<PlaylistStore>().addEndangeredPlaylists(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.secure.svg(
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 10),
              Text(
                L10n.of(context)!.endangeredPage_noDeletedVideosDetected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
