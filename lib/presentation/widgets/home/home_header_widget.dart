import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const HomeHeaderWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.displaySmall),
        TextButton(
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size.zero),
            side: WidgetStatePropertyAll(
              BorderSide(width: 2, color: Colors.grey),
            ),
          ),
          onPressed: onPressed,
          child: Text('See more', style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
