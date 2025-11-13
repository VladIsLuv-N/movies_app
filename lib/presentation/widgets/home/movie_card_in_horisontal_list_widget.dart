import 'package:flutter/material.dart';

class MovieCardInHorizontalListWidget extends StatelessWidget {
  final String imageUrl;
  final String score;
  final void Function()? onTap;

  const MovieCardInHorizontalListWidget({
    super.key,
    required this.imageUrl,
    required this.score,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.deepPurple,
            ),
            child: Row(
              children: [
                const Icon(Icons.star, size: 15, color: Colors.amber),
                const SizedBox(width: 3),
                Text(score, style: theme.textTheme.labelMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
