import 'package:flutter/material.dart';

import '../settings/routes.dart';
import 'route_tile.dart';

class NavigationMenuDrawer extends StatelessWidget {
  const NavigationMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: Routes.values.length,
        itemBuilder: (context, index) {
          final route = Routes.values[index];
          return RouteTile(route: route);
        },
      ),
    );
  }
}
