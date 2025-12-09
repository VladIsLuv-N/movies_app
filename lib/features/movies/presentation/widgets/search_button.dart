import 'package:clean_movies_app/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const SearchPage()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF3A3F47),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Search', style: theme.textTheme.labelMedium),
            const ImageIcon(
              AssetImage('assets/icons/search.png'),
              color: Color(0xFF67686D),
            ),
          ],
        ),
      ),
    );
  }
}
