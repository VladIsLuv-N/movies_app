import 'package:flutter/material.dart';
import 'package:movies_app/core/common/movie_card_widget.dart';
import 'package:movies_app/presentation/widgets/home/home_header_widget.dart';
import 'package:movies_app/presentation/widgets/home/movie_card_in_horisontal_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies', style: theme.textTheme.displaySmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            HomeHeaderWidget(title: 'Now Showing', onPressed: () {}),
            const SizedBox(height: 15),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return MovieCardInHorizontalListWidget(
                    imageUrl:
                        'https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/cf1970bc-3f08-4e0e-a095-2fb57c3aa7c6/x1000',
                    score: '8.5',
                    onTap: () {},
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            HomeHeaderWidget(title: 'Popular', onPressed: () {}),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  return MovieCardWidget(
                    imageUrl:
                        'https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/cf1970bc-3f08-4e0e-a095-2fb57c3aa7c6/x1000',
                    title: 'MovieName',
                    score: '8.5',
                    movieDuration: '1h 49m',
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
