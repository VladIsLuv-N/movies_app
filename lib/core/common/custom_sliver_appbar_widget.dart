import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  const CustomSliverAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
      ),
      pinned: true,
      floating: true,
      title: Text(title, style: theme.textTheme.displaySmall),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.white54),
              const SizedBox(width: 10),
              Text('Search', style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
