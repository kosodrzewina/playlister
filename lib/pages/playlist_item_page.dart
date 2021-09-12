import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../models.dart';
import '../repositories/youtube_repository.dart';
import '../widgets/playlists_list_item.dart';

class PlaylistItemPage extends StatefulWidget {
  final String id;
  final String title;
  final List<PlaylistItem>? items;

  const PlaylistItemPage({
    required this.id,
    required this.title,
    required this.items,
  });

  @override
  State<PlaylistItemPage> createState() => _PlaylistItemPageState();
}

class _PlaylistItemPageState extends State<PlaylistItemPage> {
  List<PlaylistItem>? _items;
  bool fetching = false;
  String? errorMessage;

  @override
  void initState() {
    if (widget.items == null) {
      fetchPlaylistItems();
    } else {
      setState(() {
        _items = widget.items;
      });
    }

    super.initState();
  }

  Future<void> fetchPlaylistItems() async {
    setState(() {
      fetching = true;
      errorMessage = null;
    });

    try {
      final res = await context
          .read<YoutubeRepository>()
          .allPlaylistItemsByPlaylistId(widget.id);

      setState(() {
        _items = res;
      });
    } on SocketException {
      errorMessage = L10n.of(context)!.error_noInternet;
    } catch (e) {
      errorMessage = L10n.of(context)!.error_unknown;
    } finally {
      setState(() {
        fetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: items != null && items.isNotEmpty
          ? ListView.separated(
              itemCount: items.length,
              padding: const EdgeInsets.all(10),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = items[index];

                return PlaylistsListItem(snippet: item.snippet);
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (fetching)
                    Assets.icons.fetching.svg(
                      height: 250,
                      width: 250,
                    )
                  else
                    Assets.icons.lookingAtVoid.svg(
                      height: 250,
                      width: 250,
                    ),
                  const SizedBox(height: 10),
                  Text(
                    fetching
                        ? L10n.of(context)!.playlistItemPage_pleaseWait
                        : L10n.of(context)!.playlistItemPage_howEmpty,
                  ),
                ],
              ),
            ),
    );
  }
}

class PlaylistItemPageRoute extends MaterialPageRoute<void> {
  PlaylistItemPageRoute({
    required String id,
    required String title,
    List<PlaylistItem>? items,
  }) : super(
          builder: (context) => PlaylistItemPage(
            id: id,
            title: title,
            items: items,
          ),
        );
}
