import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models.dart';

class ConflictPage extends StatelessWidget {
  final PlaylistItem oldVideo;
  final PlaylistItem? newVideo;

  const ConflictPage({
    required this.oldVideo,
    required this.newVideo,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Conflict page')),
      );
}

class ConflictPageRoute extends MaterialPageRoute<void> {
  ConflictPageRoute({
    required PlaylistItem oldVideo,
    required PlaylistItem newVideo,
  }) : super(
          builder: (context) => ConflictPage(
            oldVideo: oldVideo,
            newVideo: newVideo,
          ),
        );
}
