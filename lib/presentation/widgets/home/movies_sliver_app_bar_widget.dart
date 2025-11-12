import 'package:flutter/material.dart';

class MoviesSliverAppBarWidget extends StatelessWidget {
  const MoviesSliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      snap: true,
      pinned: true,
      floating: true,
      title: Text('Movies', style: theme.textTheme.displaySmall),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(74),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(20).copyWith(top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.search_rounded, color: Colors.grey),
              SizedBox(width: 5),
              Text('Search', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
