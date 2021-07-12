import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../gen/assets.gen.dart';
import 'l10n/l10n.dart';
import 'recently_added_list_item.dart';
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
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
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
        child: Container(
          margin: const EdgeInsets.only(
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

Widget renderRecentlyAddedListElement(
  BuildContext context,
  String text,
  Color color,
) {
  return Container(
    margin: const EdgeInsets.only(
      top: 5,
      bottom: 5,
    ),
    child: SizedBox(
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.grey[800],
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
              ),
              margin: const EdgeInsets.only(
                right: 10,
              ),
              height: 25,
              width: 25,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
              ),
            ),
          ],
        ),
      ),
    ),
  );
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
                color: Theme.of(context).hintColor,
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
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                L10n.of(context)!.homePage_recentlyUpdated,
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
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                L10n.of(context)!.homePage_recentlyAdded,
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: L10n.of(context)!.bottomNavBar_home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.list,
            ),
            label: L10n.of(context)!.bottomNavBar_playlists,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.warning,
            ),
            label: L10n.of(context)!.bottomNavBar_endangered,
          ),
        ],
      ),
    );
  }
}
