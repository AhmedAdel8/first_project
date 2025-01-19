import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class CacheNetworkImagesWidget extends StatelessWidget {
  const CacheNetworkImagesWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.lottiePath,
    this.boxFit,
    this.loadingImage,
  });

  final String image;
  final String? lottiePath;
  final String? loadingImage;
  final BoxFit ?  boxFit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (image.startsWith("http")) {
      return CachedNetworkImage(
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Image.asset(
            loadingImage ?? "",
            fit: BoxFit.cover,
          );
        },
        errorWidget: (context, url, error) => Image.asset(
          "",
          fit: BoxFit.cover,
        ),
        imageUrl: image,
        fit: boxFit,
        width: width,
        height: height,
      );
    } else if (image.endsWith("svg")) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: boxFit!,
      );
    }
   else {
     return Image.asset(
       image ,
       width: width,
       height: height,
       fit: boxFit!,
     );
    }
  }
}
