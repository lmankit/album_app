import 'dart:convert';

import 'package:album_app/models/album_response.dart';
import 'package:album_app/providers/base_provider.dart';
import 'package:album_app/utils/preference_utils.dart';

class BookmarkProvider extends BaseProvider {
  var prefs = PreferenceUtils();
  List<Results> bookmarks = [];

  BookmarkProvider() {
    getBookmark();
  }

  void getBookmark() {
    var decoded = jsonDecode(prefs.bookmarks);
    List<Results> results = List<Results>.from(decoded.map((e) => Results.fromJson(e)));
    bookmarks = results;
    notifyListeners();
  }

  void bookmark(Results album) {
    if (checkBookmark(album)) {
      bookmarks.removeWhere((e) => e.collectionId == album.collectionId);
    } else {
      bookmarks.add(album);
    }
    prefs.bookmarks = jsonEncode(bookmarks);
    notifyListeners();
  }

  void remove(int index) {
    print('remove at $index');
    bookmarks.removeAt(index);
    notifyListeners();
  }

  bool checkBookmark(Results album) {
    var id = album.collectionId;
    for (var e in bookmarks) {
      if (e.collectionId == id) {
        return true;
      }
    }
    return false;
  }
}
