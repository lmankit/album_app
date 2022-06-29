import 'package:album_app/models/album_response.dart';
import 'package:album_app/providers/album_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/base_provider.dart';
import '../widgets/album_item.dart';
import '../widgets/custom_separator.dart';
import '../widgets/skeleton.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlbumProvider albumProvider = context.watch<AlbumProvider>();
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Consumer<AlbumProvider>(
        builder: (context, viewModel, child) {
          if (albumProvider.status == Status.loading) {
            return buildLoadingWidget();
          }
          return buildAlbumList(albumProvider.albumList);
        },
      ),
    );
  }

  Widget buildAlbumList(List<Results> albumList) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: albumList.length,
      itemBuilder: (_, index) => AlbumItem(album: albumList[index]),
      separatorBuilder: (_, index) => CustomSeparator(),
    );
  }

  Widget buildLoadingWidget() {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (_, index) => AlbumSkeleton(),
      separatorBuilder: (_, index) => CustomSeparator(),
    );
  }
}
