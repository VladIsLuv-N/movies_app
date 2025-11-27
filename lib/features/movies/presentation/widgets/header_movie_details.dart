import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movie_poster_widget.dart';
import 'package:flutter/material.dart';

class HeaderMovieDetails extends StatelessWidget {
  final String posterUrl;
  final String backdropUrl;
  final double raiting;
  final String movieName;

  const HeaderMovieDetails({
    super.key,
    required this.posterUrl,
    required this.backdropUrl,
    required this.raiting,
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 270,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: CachedNetworkImage(
              imageUrl: backdropUrl,
              height: 210,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  ColoredBox(color: Colors.grey.withValues(alpha: 0.1)),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
          Container(
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: const BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            child: MoviePosterWidget(posterUrl: posterUrl, height: 150),
          ),
          Positioned(
            left: 150,
            bottom: 0,
            width: 200,
            child: Text(
              movieName,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          Positioned(
            right: 15,
            bottom: 75,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0x80242A32),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star_border_rounded,
                    color: Color(0xFFFF8700),
                  ),
                  Text(
                    '$raiting',
                    style: const TextStyle(color: Color(0xFFFF8700)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
