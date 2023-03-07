import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget Function() onMobile;
  final Widget Function() onDesktop;

  const ResponsiveLayout({
    super.key,
    required this.onMobile,
    required this.onDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 768) {
          return onMobile();
        } else {
          return onDesktop();
        }
      },
    );
  }
}
