import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../gen/assets.gen.dart';
import 'recently_added_list_item.dart';
import 'recently_updated_list_item.dart';
import 'themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playlister',
      theme: darkTheme,
      home: const MyHomePage(title: 'Playlister'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
        title: Text(widget.title),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Assets.icons.logo.svg(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: Assets.images.avatar,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                'Recently updated',
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(
                  width: 10,
                ),
                RecentlyUpdatedListItem(
                  text: 'Playlist name',
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                RecentlyUpdatedListItem(
                  text: 'Playlist name',
                  color: Colors.teal,
                ),
                SizedBox(width: 10),
                RecentlyUpdatedListItem(
                  text: 'Playlist name',
                  color: Colors.amber,
                ),
                SizedBox(width: 10),
                RecentlyUpdatedListItem(
                  text: 'Playlist name',
                  color: Colors.purpleAccent,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                'Recently added',
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              shrinkWrap: true,
              children: const [
                RecentlyAddedListItem(
                  text: 'Playlist name',
                  color: Colors.teal,
                ),
                SizedBox(height: 10),
                RecentlyAddedListItem(
                  text: 'Playlist name',
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                RecentlyAddedListItem(
                  text: 'Playlist name',
                  color: Colors.purple,
                ),
                SizedBox(height: 10),
                RecentlyAddedListItem(
                  text: 'Playlist name',
                  color: Colors.yellow,
                ),
                SizedBox(height: 10),
                RecentlyAddedListItem(
                  text: 'Playlist name',
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                RecentlyAddedListItem(
                  text: 'Playlist name',
                  color: Colors.teal,
                ),
                SizedBox(height: 10),
                RecentlyAddedListItem(
                  text: 'Playlist name',
                  color: Colors.purple,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Playlists',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.warning,
            ),
            label: 'Endangered',
          ),
        ],
      ),
    );
  }
}
