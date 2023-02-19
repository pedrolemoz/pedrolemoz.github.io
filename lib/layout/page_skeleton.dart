import 'package:flutter/material.dart';

import '../components/navigation_menu_drawer.dart';
import 'responsive_layout.dart';

class PageSkeleton extends StatelessWidget {
  final Widget child;

  const PageSkeleton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      onDesktop: () {
        return Scaffold(
          body: Row(
            children: [
              SizedBox(child: NavigationMenuDrawer(), width: 250),
              Expanded(child: child),
            ],
          ),
        );
      },
      onMobile: () {
        return Scaffold(
          appBar: AppBar(),
          drawer: NavigationMenuDrawer(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
