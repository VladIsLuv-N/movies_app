import 'package:clean_movies_app/core/widgets/outline_text.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movie_poster_widget.dart';
import 'package:flutter/material.dart';

class TopFilmsCard extends StatelessWidget {
  final String posterUrl;
  final int number;
  final void Function()? onTap;

  const TopFilmsCard({
    super.key,
    required this.posterUrl,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 180,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MoviePosterWidget(
                onTap: onTap,
                posterUrl: posterUrl,
                height: 250,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: OutlineText(
              text: '$number',
              fontFamily: 'Montserrat',
              fillColor: const Color(0xFF242A32),
              outlineColor: const Color(0xFF0296E5),
              strokeWidth: 1,
              fontSize: 110,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
