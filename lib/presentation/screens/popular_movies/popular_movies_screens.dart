import 'package:flutter/material.dart';
import 'package:movies_app/core/common/custom_sliver_appbar_widget.dart';
import 'package:movies_app/core/common/movie_card_widget.dart';
import 'package:movies_app/presentation/screens/movie_details/movie_details_screen.dart';

class PopularMoviesScreens extends StatelessWidget {
  const PopularMoviesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Popular Movies'),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
            SliverList.separated(
              itemCount: 30,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return MovieCardWidget(
                  imageUrl:
                      'https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/cf1970bc-3f08-4e0e-a095-2fb57c3aa7c6/x1000',
                  title: 'MovieName',
                  score: '8.5',
                  movieDuration: '1h 49m',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MovieDetailsScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
