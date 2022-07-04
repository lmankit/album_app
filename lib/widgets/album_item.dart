import 'package:cached_network_image/cached_network_image.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
        child: Row(
          children: [
            CachedNetworkImage(
              width: 60,
              imageUrl: album.artworkUrl60!,
              placeholder: (context, url) => Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (_, url, error) => Icon(Icons.error_outline, color: Colors.white),
            ),
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
                  color: bookmarkProvider.checkBookmark(album) ? Colors.yellow : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
