import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';

class ExternalLinkButton extends StatelessWidget {
  final String name;
  final String url;

  final isHovered = ValueNotifier<bool>(false);

  ExternalLinkButton({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, value, widget) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onExit: (_) => isHovered.value = false,
          onHover: (_) => isHovered.value = true,
          child: GestureDetector(
            onTap: () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  switch (name) {
                    'GitHub' => UniconsLine.github,
                    'LinkedIn' => UniconsLine.linkedin,
                    'E-mail' => UniconsLine.envelope,
                    String() when name.contains('Resume') =>
                      UniconsLine.file_download,
                    String() => UniconsLine.link,
                  },
                  size: 30,
                  color: value ? ThemeColors.white : ThemeColors.lightGray,
                ),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: value ? ThemeColors.white : ThemeColors.lightGray,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
