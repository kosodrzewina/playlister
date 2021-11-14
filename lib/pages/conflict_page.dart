import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_extensions.dart';
import '../models.dart';
import '../stores/playlist_store.dart';

class ConflictPage extends StatelessWidget {
  final PlaylistItem oldVideo;
  final PlaylistItem? newVideo;

  const ConflictPage({required this.oldVideo, required this.newVideo});

  @override
  Widget build(BuildContext context) {
    final _playlistStore = context.read<PlaylistStore>();

    return newVideo != null
        ? Scaffold(
            appBar: AppBar(title: const Text('Conflict page')),
            body: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      newVideo!.snippet.thumbnails.thumbnail,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: Card(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const SizedBox(width: 20),
                            Text(
                              'Title',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 10),
                            Card(
                              elevation: 0,
                              color: Colors.orange[200],
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Text(
                                    'OLD:',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    oldVideo.snippet.title,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Card(
                              elevation: 0,
                              color: Colors.green[200],
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Text(
                                    'NEW:',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    newVideo!.snippet.title,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[400]),
                  ),
                  onPressed: () {
                    _playlistStore.updateVideoTitle(
                      oldVideo.id,
                      newVideo!.snippet.title,
                    );
                  },
                  child: Text(
                    'ACCEPT CHANGES',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        : const Center();
  }
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
