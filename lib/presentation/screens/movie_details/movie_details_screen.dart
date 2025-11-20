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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////////////////////////////
            const AppBarMovieDetailsWidget(
              backgroundImageUrl:
                  'https://image.openmoviedb.com/kinopoisk-ott-images/236744/2a0000019a3ed31049a5420ac4c24737f170/678x380',
              posterUrl:
                  'https://image.openmoviedb.com/kinopoisk-images/10703959/382c1fff-64cd-4f18-ada1-23caf1b3ecff/300x450',
            ),
            ///////////////////////
            const SizedBox(height: 20),
            ///////////////////////////
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 8),
              child: Text(
                'MovieName',
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 17),
                  const SizedBox(width: 2),
                  Text(
                    '8/10 IMDb',
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
            //////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: ['Драма', 'Комедия']
                    .map(
                      (genre) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBE3FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          genre,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontSize: 12,
                            color: const Color(0xFF88A4E8),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            ///////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lenght',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '1h28m',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Raiting',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '18+',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Language',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Русский',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //////////////////////////////
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 10),
              child: Text('Description', style: theme.textTheme.displaySmall),
            ),
            /////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Text(
                'Когда в небольшом городке в штате Кентукки появляется cамый разыскиваемый человек в Америке, за ним начинает охоту толпа, жаждущая мести и богатства. Пока братья вступают в схватку, а город погружается в хаос, этот безжалостный стрелок заставляет своих противников заплатить за их преступления.',
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 15),
              ),
            ),
            /////////////////////////////////
            SizedBox(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 13),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.network(
                              'https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/a716b226-aced-4068-bcdd-a87321992f3f/orig',
                            ),
                          ),
                          Text(
                            'Филипп Поццо ди Борго',
                            maxLines: 2,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
