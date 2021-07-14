import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/playlists_list_item.dart';

class PlaylistsPage extends StatefulWidget {
  const PlaylistsPage();

  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  String currentSort = 'Sort by 0';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: DropdownButton<String>(
            value: currentSort,
            icon: const Icon(Icons.filter_list),
            items: [
              for (var item in ['Sort by 0', 'Sort by 1', 'Sort by 2'])
                DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ),
            ],
            onChanged: (value) {
              setState(() {
                currentSort = value!;
              });
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            shrinkWrap: true,
            children: const [
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.teal,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.red,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.purple,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.yellow,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.red,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.teal,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.purple,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.teal,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.red,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.purple,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.yellow,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.red,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.teal,
              ),
              SizedBox(height: 10),
              PlaylistsListItem(
                text: 'Playlist name',
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
