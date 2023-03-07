import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils/routes.dart';
import 'route_tile.dart';

class NavigationMenuDrawer extends StatelessWidget {
  const NavigationMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Modular.to.path;

    return Drawer(
      child: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final element = routes[index];
          final route = element['route']!;
          final title = element['title']!;

          return RouteTile(
            route: route,
            title: title,
            boldTitle: currentRoute == route,
          );
        },
      ),
    );
  }
}
