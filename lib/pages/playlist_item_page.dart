import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models.dart';

class PlaylistItemPage extends StatelessWidget {
  final String title;
  final List<PlaylistItem>? items;

  const PlaylistItemPage({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: items != null
          ? ListView.separated(
              itemCount: items!.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = items![index];

                return Text(item.snippet.title);
              },
            )
          : const Center(child: Text("nothing's here")),
    );
  }
}
