import 'package:clean_movies_app/core/widgets/movie_card_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to watch?',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              TextField(
                autofocus: true,
                cursorColor: Colors.white,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  hintStyle: theme.textTheme.labelMedium,
                  suffixIcon: const ImageIcon(
                    AssetImage('assets/icons/search.png'),
                    color: Color(0xFF67686D),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF3A3F47),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    return const MovieCardWidget(
                      title: 'SpiderMan',
                      raiting: 9.5,
                      genre: 'Action',
                      year: 2025,
                      minutes: 136,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
