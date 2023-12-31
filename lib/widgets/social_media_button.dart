import 'package:flutter/material.dart';

import '../utils/colors.dart';

typedef OnSocialMediaButtonClickCallBack = void Function();

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final OnSocialMediaButtonClickCallBack onClick;

  final isHovered = ValueNotifier<bool>(false);

  SocialMediaButton({
    super.key,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, value, widget) {
        return MouseRegion(
          onExit: (_) => isHovered.value = false,
          onHover: (_) => isHovered.value = true,
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: onClick,
            icon: Icon(
              icon,
              size: 30,
              color: value ? ThemeColors.white : ThemeColors.lightGray,
            ),
          ),
        );
      },
    );
  }
}
