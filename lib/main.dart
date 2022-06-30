import 'package:album_app/providers/album_provider.dart';
import 'package:album_app/providers/bookmark_provider.dart';
import 'package:album_app/providers/navigation_bar_provider.dart';
import 'package:album_app/utils/preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => AlbumProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
