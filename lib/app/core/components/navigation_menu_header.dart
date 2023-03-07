import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils/routes.dart';
import 'route_button.dart';

class NavigationMenuHeader extends StatelessWidget {
  const NavigationMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Modular.to.path;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: routes.map<Widget>(
          (element) {
            final route = element['route']!;
            final title = element['title']!;

            return RouteButton(
              route: route,
              title: title,
              boldTitle: currentRoute == route,
            );
          },
        ).toList(),
      ),
    );
  }
}
