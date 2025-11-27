import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePosterWidget extends StatelessWidget {
  final String posterUrl;
  final double height;
  final void Function()? onTap;

  const MoviePosterWidget({
    super.key,
    required this.posterUrl,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          height: height,
          fit: BoxFit.cover,
          imageUrl: posterUrl,
          placeholder: (context, url) =>
              ColoredBox(color: Colors.grey.withValues(alpha: 0.1)),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
