import 'package:album_app/models/album_response.dart';
import 'package:album_app/providers/album_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/style.dart';
import '../providers/base_provider.dart';
import '../widgets/album_item.dart';
import '../widgets/custom_separator.dart';
import '../widgets/skeleton.dart';

class AlbumList extends StatelessWidget {
  AlbumList({Key? key}) : super(key: key);

  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController? searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AlbumProvider albumProvider = context.watch<AlbumProvider>();
    return Consumer<AlbumProvider>(
      builder: (context, viewModel, child) {
        if (albumProvider.status == Status.loading) {
          return buildLoadingWidget();
        } else if (albumProvider.status == Status.error) {
          return Center(
            child: ElevatedButton(
              child: Text('Retry'),
              onPressed: () => albumProvider.getAlbumData(),
            ),
          );
        }
        return Column(
          children: [
            buildSearchBar(albumProvider),
            Expanded(
              child: albumProvider.haveSearchKey ? buildSearchList(albumProvider.searchList) : buildAlbumList(albumProvider.albumList),
            ),
          ],
        );
      },
    );
  }

  Widget buildSearchList(List<Results> albumList) {
    return albumList.isEmpty
        ? Center(child: Text('No Results', style: kHeadingTextStyle))
        : ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 10),
            itemCount: albumList.length,
            itemBuilder: (_, index) => AlbumItem(album: albumList[index]),
            separatorBuilder: (_, index) => CustomSeparator(),
          );
  }

  Widget buildAlbumList(List<Results> albumList) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10),
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

  Widget buildSearchBar(AlbumProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: CupertinoSearchTextField(
        padding: EdgeInsets.symmetric(vertical: 10),
        prefixIcon: Icon(CupertinoIcons.search, color: Colors.white),
        prefixInsets: EdgeInsets.only(left: 15, right: 8),
        suffixIcon: Icon(Icons.cancel, color: Colors.white),
        suffixInsets: EdgeInsets.symmetric(horizontal: 10),
        focusNode: searchFocusNode,
        style: TextStyle(color: Colors.white),
        placeholder: "album...",
        placeholderStyle: TextStyle(color: Colors.grey),
        controller: searchEditingController,
        onChanged: (value) => provider.search(value),
      ),
    );
  }
}
