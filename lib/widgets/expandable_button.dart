import 'package:flutter/material.dart';

import '../utils/colors.dart';

typedef OnExpandableButtonClickCallBack = void Function();

class ExpandableButton extends StatelessWidget {
  final String label;
  final OnExpandableButtonClickCallBack onClick;

  static const double _expandedSize = 70;
  static const double _shrinkedSize = _expandedSize / 2;

  final isHovered = ValueNotifier<bool>(false);

  ExpandableButton({
    super.key,
    required this.label,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, value, widget) {
        return GestureDetector(
          onTap: onClick,
          child: MouseRegion(
            onExit: (_) => isHovered.value = false,
            onHover: (_) => isHovered.value = true,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    color: value ? ThemeColors.white : ThemeColors.lightGray,
                    width: value ? _expandedSize : _shrinkedSize,
                    height: 2,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label.toUpperCase(),
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: value ? ThemeColors.white : ThemeColors.lightGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
