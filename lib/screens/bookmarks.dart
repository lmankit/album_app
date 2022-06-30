import 'package:album_app/common/style.dart';
import 'package:album_app/providers/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/album_response.dart';
import '../widgets/album_item.dart';
import '../widgets/custom_separator.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookmarkProvider bookmarkProvider = context.watch<BookmarkProvider>();
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Consumer<BookmarkProvider>(
        builder: (context, viewModel, child) {
          if (bookmarkProvider.bookmarks.isEmpty) {
            return noBookmarkMessage();
          }
          return buildAlbumList(bookmarkProvider.bookmarks);
        },
      ),
    );
  }

  Widget buildAlbumList(List<Results> albumList) {
    return ListView.separated(
      itemCount: albumList.length,
      itemBuilder: (_, index) => AlbumItem(
        album: albumList[index],
        showBookmark: false,
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
