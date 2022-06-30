import 'package:album_app/common/style.dart';
import 'package:album_app/providers/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:provider/provider.dart';

import '../widgets/album_item.dart';
import '../widgets/custom_separator.dart';

class Bookmarks extends StatelessWidget {
  Bookmarks({Key? key}) : super(key: key);

  final SwipeActionController swipeActionController = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    BookmarkProvider bookmarkProvider = context.watch<BookmarkProvider>();
    return Consumer<BookmarkProvider>(
      builder: (context, viewModel, child) {
        if (bookmarkProvider.bookmarks.isEmpty) {
          return noBookmarkMessage();
        }
        return buildAlbumList(bookmarkProvider);
      },
    );
  }

  Widget buildAlbumList(BookmarkProvider bookmarkProvider) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20),
      itemCount: bookmarkProvider.bookmarks.length,
      itemBuilder: (_, index) => SwipeActionCell(
        backgroundColor: Colors.black87,
        key: ValueKey(index),
        index: index,
        controller: swipeActionController,
        child: AlbumItem(
          album: bookmarkProvider.bookmarks[index],
          showBookmark: false,
        ),
        trailingActions: <SwipeAction>[
          SwipeAction(
              backgroundRadius: 12,
              widthSpace: 60,
              icon: Icon(Icons.delete_outline, color: Colors.white, size: 25),
              color: Colors.red,
              onTap: (CompletionHandler handler) {
                bookmarkProvider.remove(index);
                swipeActionController.closeAllOpenCell();
              }),
        ],
      ),
      separatorBuilder: (_, index) => CustomSeparator(),
    );
  }

  Widget noBookmarkMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.music_note,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(height: 10),
          Text('No Saved Album!', style: kHeadingTextStyle),
        ],
      ),
    );
  }
}
