import 'package:clean_movies_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MovieInfoWidget extends StatelessWidget {
  final int year;
  final int minutes;
  final String genre;

  const MovieInfoWidget({
    super.key,
    required this.year,
    required this.minutes,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 20,
          color: Color(0xFF92929D),
        ),
        const SizedBox(width: 5),
        Text('$year', style: theme.textTheme.labelSmall),
        const SizedBox(width: 15),
        Container(width: 1, height: 20, color: const Color(0xFF696974)),
        const SizedBox(width: 15),
        const Icon(Icons.access_time, size: 20, color: Color(0xFF92929D)),
        const SizedBox(width: 5),
        Text(S.of(context).minutes(minutes), style: theme.textTheme.labelSmall),
        const SizedBox(width: 15),
        Container(width: 1, height: 20, color: const Color(0xFF696974)),
        const SizedBox(width: 15),
        const Icon(Icons.theaters_outlined, size: 20, color: Color(0xFF92929D)),
        const SizedBox(width: 5),
        Text(genre, style: theme.textTheme.labelSmall),
        const SizedBox(width: 15),
        Container(width: 1, height: 20, color: const Color(0xFF696974)),
      ],
    );
  }
}
