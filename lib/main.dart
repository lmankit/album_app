import 'package:album_app/providers/album_provider.dart';
import 'package:album_app/providers/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => AlbumProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
