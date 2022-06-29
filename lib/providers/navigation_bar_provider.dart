import 'package:album_app/screens/album_list.dart';
import 'package:album_app/screens/bookmarks.dart';
import 'package:flutter/material.dart';

class NavigationBarProvider with ChangeNotifier {
  int currentIndex = 0;

  var currentTab = [
    AlbumList(),
    Bookmarks(),
  ];

  var tabTitle = ['Albums', 'Bookmarks'];

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
