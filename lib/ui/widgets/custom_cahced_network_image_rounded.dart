import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageRounded extends StatelessWidget {
  final String imageUrl;
  final double height, width;
  final BorderRadius borderRadius;
  final BoxFit boxFit;

  const CachedNetworkImageRounded(
      {Key? key,
      required this.imageUrl,
      required this.height,
      required this.width,
      this.borderRadius = BorderRadius.zero,
      this.boxFit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: height,
          width: width,
          fit: boxFit,
          errorWidget: (context, url, error) {
            return Container(
              color: Colors.grey,
              child: Center(
                child: Icon(
                  Icons.error,
                  color: Colors.black,
                ),
              ),
            );
          },
        ));
  }
}
