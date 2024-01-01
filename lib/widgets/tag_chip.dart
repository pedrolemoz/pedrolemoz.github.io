import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TagChip extends StatelessWidget {
  final String label;

  const TagChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.darkViolet,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          label.toUpperCase(),
          style: textTheme.labelMedium?.copyWith(
            color: ThemeColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
