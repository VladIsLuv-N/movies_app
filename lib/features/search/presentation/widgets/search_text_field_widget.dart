import 'package:clean_movies_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchTextFieldWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      onChanged: onChanged,
      autofocus: true,
      cursorColor: Colors.white,
      style: theme.textTheme.labelMedium?.copyWith(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        hintText: S.of(context).search,
        hintStyle: theme.textTheme.labelMedium,
        suffixIcon: const ImageIcon(
          AssetImage('assets/icons/search.png'),
          color: Color(0xFF67686D),
        ),
        filled: true,
        fillColor: const Color(0xFF3A3F47),
      ),
    );
  }
}
