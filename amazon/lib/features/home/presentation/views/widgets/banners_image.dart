import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannersImage extends StatelessWidget {
  const BannersImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width:double.infinity,
        fit: BoxFit.fill,
        placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
        imageUrl: image);
  }
}
