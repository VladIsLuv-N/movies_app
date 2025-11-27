import 'package:flutter/material.dart';

class MoviesTabs extends StatefulWidget {
  final List<Widget> children;
  final List<String> tabs;
  const MoviesTabs({super.key, required this.children, required this.tabs});

  @override
  State<MoviesTabs> createState() => _MoviesTabsState();
}

class _MoviesTabsState extends State<MoviesTabs> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(widget.tabs.length, (index) {
            final isActive = index == selected;

            return GestureDetector(
              onTap: () => setState(() => selected = index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.tabs[index], style: theme.textTheme.bodyMedium),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 3,
                    width: isActive ? 60 : 0,
                    margin: const EdgeInsets.only(top: 4),
                    color: isActive
                        ? const Color(0xFF3A3F47)
                        : Colors.transparent,
                  ),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: IndexedStack(index: selected, children: widget.children),
        ),
      ],
    );
  }
}
