import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/style.dart';
import '../models/album_response.dart';
import '../providers/bookmark_provider.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    Key? key,
    required this.album,
    this.showBookmark = true,
  }) : super(key: key);

  final Results album;
  final bool showBookmark;

  @override
  Widget build(BuildContext context) {
    BookmarkProvider bookmarkProvider = context.watch<BookmarkProvider>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.network(album.artworkUrl60!),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.collectionName!,
                    style: kTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    album.artistName!,
                    style: kSubTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: showBookmark,
              child: IconButton(
                onPressed: () {
                  bookmarkProvider.bookmark(album);
                },
                icon: Icon(
                  Icons.star,
                  color: bookmarkProvider.bookmarks.contains(album) ? Colors.yellow : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
