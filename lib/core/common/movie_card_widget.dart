import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String score;
  final String movieDuration;
  final void Function()? onTap;

  const MovieCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.score,
    required this.movieDuration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          height: 120,
          width: 85,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 17),
                const SizedBox(width: 2),
                Text(
                  '$score/10 IMDb',
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.timer, color: Colors.deepPurple, size: 17),
                const SizedBox(width: 2),
                Text(
                  movieDuration,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
