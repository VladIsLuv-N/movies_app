import 'package:flutter/material.dart';
import 'package:movies_app/presentation/widgets/movie_details/app_bar_movie_details_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarMovieDetailsWidget(
              backgroundImageUrl:
                  'https://image.openmoviedb.com/kinopoisk-ott-images/236744/2a0000019a3ed31049a5420ac4c24737f170/678x380',
              posterUrl:
                  'https://image.openmoviedb.com/kinopoisk-images/10703959/382c1fff-64cd-4f18-ada1-23caf1b3ecff/300x450',
            ),
            Text('MovieName', style: theme.textTheme.titleMedium?.copyWith(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
