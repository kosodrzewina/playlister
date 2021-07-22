import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import 'l10n/l10n.dart';
import 'pages/endangered_page.dart';
import 'pages/home_page.dart';
import 'pages/playlists_page.dart';
import 'pages/profile_dialog.dart';
import 'stores/auth_store.dart';
import 'stores/playlist_store.dart';
import 'themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authStore = AuthStore();
  final playlistStore = PlaylistStore();

  await authStore.initialize();
  await playlistStore.initialize();

  if (authStore.apiKey != null) {
    await playlistStore.setPlaylistsByChannelId(
      authStore.apiKey!,
      'UC-lHJZR3Gqxm24_Vd_AJ5Yw', // PewDiePie channelId for testing purposes
    );
  }

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: authStore),
        Provider.value(value: playlistStore),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      title: 'Playlister',
      theme: lightTheme,
      darkTheme: darkTheme,
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
  int currentBottomNavBarIndex = 0;
  static const pages = [
    HomePage(),
    PlaylistsPage(),
    EndangeredPage(),
  ];

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
            child: GestureDetector(
              onTap: () async {
                await showProfileDialog(context);
              },
              child: CircleAvatar(
                radius: 15,
                backgroundImage: Assets.images.avatar,
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentBottomNavBarIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            currentBottomNavBarIndex = i;
          });
        },
        currentIndex: currentBottomNavBarIndex,
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
