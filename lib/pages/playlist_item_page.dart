import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaylistItemPage extends StatelessWidget {
  final String title;

  const PlaylistItemPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('test'),
      ),
    );
  }
}
