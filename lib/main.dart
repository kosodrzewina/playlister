import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../gen/assets.gen.dart';
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

class RecentlyUpdatedListItem extends StatelessWidget {
  final String text;
  final Color color;

  const RecentlyUpdatedListItem({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              side: const BorderSide(
                color: Colors.white,
                width: 1.5,
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}

class RecentlyAddedListItem extends StatelessWidget {
  final String text;
  final Color color;

  const RecentlyAddedListItem({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[800],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                height: 25,
                width: 25,
              ),
              Text(
                text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: Colors.grey,
            height: 0.5,
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Recently updated',
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  RecentlyUpdatedListItem(
                    text: 'Playlist name',
                    color: Colors.red,
                  ),
                  RecentlyUpdatedListItem(
                    text: 'Playlist name',
                    color: Colors.teal,
                  ),
                  RecentlyUpdatedListItem(
                    text: 'Playlist name',
                    color: Colors.amber,
                  ),
                  RecentlyUpdatedListItem(
                    text: 'Playlist name',
                    color: Colors.purpleAccent,
                  )
                ],
              ),
            ),
            const Text(
              'Recently added',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    RecentlyAddedListItem(
                      text: 'Playlist name',
                      color: Colors.teal,
                    ),
                    RecentlyAddedListItem(
                      text: 'Playlist name',
                      color: Colors.red,
                    ),
                    RecentlyAddedListItem(
                      text: 'Playlist name',
                      color: Colors.purple,
                    ),
                    RecentlyAddedListItem(
                      text: 'Playlist name',
                      color: Colors.yellow,
                    ),
                    RecentlyAddedListItem(
                      text: 'Playlist name',
                      color: Colors.red,
                    ),
                    RecentlyAddedListItem(
                      text: 'Playlist name',
                      color: Colors.teal,
                    ),
                    RecentlyAddedListItem(
                      text: 'Playlist name',
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
