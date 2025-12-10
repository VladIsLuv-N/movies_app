import 'package:clean_movies_app/core/widgets/movie_poster_widget.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final String title;
  final double raiting;
  final int year;
  final int minutes;
  final String genre;
  final String posterUrl;

  const MovieCardWidget({
    super.key,
    required this.title,
    required this.raiting,
    required this.year,
    required this.minutes,
    required this.genre,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        MoviePosterWidget(posterUrl: posterUrl, height: 160),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              Row(
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
              Row(
                children: [
                  const Icon(
                    Icons.theaters_outlined,
                    size: 20,
                    color: Color(0xFF92929D),
                  ),
                  const SizedBox(width: 5),
                  Text(genre, style: theme.textTheme.labelSmall),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: Color(0xFF92929D),
                  ),
                  const SizedBox(width: 5),
                  Text('$year', style: theme.textTheme.labelSmall),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 20,
                    color: Color(0xFF92929D),
                  ),
                  const SizedBox(width: 5),
                  Text('$minutes minutes', style: theme.textTheme.labelSmall),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
