import 'package:clean_movies_app/features/movies/presentation/widgets/header_movie_details.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
        ],
      ),
      body: const Column(
        children: [
          HeaderMovieDetails(
            posterUrl:
                'https://image.openmoviedb.com/kinopoisk-images/10900341/caf9f155-1a19-42f1-a0f3-9c8773e9083e/600x900',
            backdropUrl:
                'https://image.openmoviedb.com/tmdb-images/original/q6OGlZ1KMEb14AC8KbPCxyNOal6.jpg',
            raiting: 8.8,
            movieName: 'Spiderman No Way Home',
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 20,
                color: Color(0xFF92929D),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
