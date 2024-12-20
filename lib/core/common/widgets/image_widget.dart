import 'package:flutter/material.dart';

class CacheImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final double radius;

  const CacheImageWidget({
    super.key,
    required this.imageUrl,
    this.width = 24.0,
    this.height = 24.0,
    this.fit = BoxFit.none,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, error, stackTrace) {
          return Image.asset(
            'assets/images/empty.jpg',
            width: width,
            height: height,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}

