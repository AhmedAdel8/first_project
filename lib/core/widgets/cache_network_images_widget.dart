import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CacheNetworkImagesWidget extends StatelessWidget {
  const CacheNetworkImagesWidget({
    super.key,
    required this.imageUrl,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    required this.width,
    required this.height,
    required this.lottiePath,
    required this.loadingImage,
  });

  final String imageUrl;
  final String lottiePath;
  final String loadingImage;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
      ),
      child: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Image.asset(
            loadingImage,
            fit: BoxFit.cover,
          );
        },
        errorWidget: (context, url, error) => Lottie.asset(
          lottiePath,
        ),
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
