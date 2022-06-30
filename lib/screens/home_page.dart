import 'package:album_app/providers/album_provider.dart';
import 'package:album_app/providers/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationBarProvider provider = context.watch<NavigationBarProvider>();
    return Consumer<AlbumProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(provider.tabTitle[provider.currentIndex]),
          ),
          backgroundColor: Colors.black54,
          body: provider.currentTab[provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            unselectedItemColor: Colors.grey,
            onTap: (index) => provider.changeIndex(index),
            currentIndex: provider.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
              BottomNavigationBarItem(icon: Icon(Icons.bookmarks), label: 'Bookmarks'),
            ],
          ),
        );
      },
    );
  }
}
