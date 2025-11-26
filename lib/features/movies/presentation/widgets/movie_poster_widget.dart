import 'package:flutter/material.dart';

class MoviePosterWidget extends StatelessWidget {
  final String posterUrl;
  final double height;

  const MoviePosterWidget({
    super.key,
    required this.posterUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(posterUrl, height: height, fit: BoxFit.cover),
    );
  }
}
