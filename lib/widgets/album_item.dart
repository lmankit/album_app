import 'package:flutter/material.dart';

import '../common/style.dart';
import '../models/album_response.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Results album;

  @override
  Widget build(BuildContext context) {
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
                    style: titleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    album.artistName!,
                    style: subTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  print('bookmark');
                },
                icon: Icon(
                  Icons.star,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }
}
