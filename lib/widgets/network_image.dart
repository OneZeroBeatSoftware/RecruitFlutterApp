import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetImage extends StatelessWidget {
  final String img;
  final String placeholder;
  final String error;
  final num size;

  const NetImage({Key key, this.img, this.placeholder, this.error, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: img,
        fit: BoxFit.cover,
        width: size,
        height: size,
        errorWidget: (context, url, error) {
          return Image.asset(placeholder,
              fit: BoxFit.cover,
              width: size,
              height: size);
        },
        placeholder: (context, url) {
          return Image.asset(error,
              fit: BoxFit.cover,
              width: size,
              height: size);
        });
  }
}
