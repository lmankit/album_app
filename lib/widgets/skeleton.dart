import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final double? height, width;
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.14),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}

class AlbumSkeleton extends StatelessWidget {
  const AlbumSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        enabled: true,
        child: Row(
          children: [
            Skeleton(
              width: 60,
              height: 60,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(width: 200),
                SizedBox(height: 5),
                Skeleton(width: 150),
              ],
            ),
            Expanded(child: SizedBox()),
            Icon(Icons.star, color: Colors.black.withOpacity(0.14)),
          ],
        ),
      ),
    );
  }
}
