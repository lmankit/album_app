import 'package:album_app/models/album_response.dart';
import 'package:album_app/providers/base_provider.dart';

class BookmarkProvider extends BaseProvider {
  List<Results> bookmarks = [];

  void bookmark(Results album) {
    if (bookmarks.contains(album)) {
      bookmarks.remove(album);
      notifyListeners();
      return;
    }
    bookmarks.add(album);
    notifyListeners();
  }
}
