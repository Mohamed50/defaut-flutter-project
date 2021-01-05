import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleCachedAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Color color;
  final BlendMode blendMode;
  const CircleCachedAvatar({Key key, this.imageUrl, this.size, this.color, this.blendMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        color: color ?? Colors.transparent,
        colorBlendMode: blendMode ?? BlendMode.color,
        placeholder: (context, url) => Container(
          width: size ?? 80,
          height: size ?? 80,
          color: Colors.grey[300],
        ),
        errorWidget: (context, url, error) => Container(
            width: size ?? 80,
            height: size ?? 80,
            child: Icon(CupertinoIcons.profile_circled,size: size,)
        ),
        width: size ?? 80,
        height: size ?? 80,
      ),
    );
  }
}
