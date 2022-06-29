import 'package:album_app/providers/album_provider.dart';
import 'package:album_app/providers/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<NavigationBarProvider>();
    return Consumer<AlbumProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: provider.currentTab[provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => provider.changeIndex(index),
            currentIndex: provider.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
            ],
          ),
        );
      },
    );
  }
}
