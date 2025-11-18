import 'package:flutter/material.dart';

class AppBarMovieDetailsWidget extends StatelessWidget {
  final String backgroundImageUrl;
  final String posterUrl;

  const AppBarMovieDetailsWidget({
    super.key,
    required this.backgroundImageUrl,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          backgroundImageUrl,
        ),
        Container(
          width: double.infinity,
          height: 250,
          color: Colors.black.withValues(alpha: 0.5),
        ),
        Positioned(
          left: 40,
          bottom: 25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(height: 200, posterUrl),
          ),
        ),
      ],
    );
  }
}
