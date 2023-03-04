import 'package:flutter/material.dart';

import 'route_tile.dart';

class NavigationMenuDrawer extends StatelessWidget {
  const NavigationMenuDrawer({super.key});

  static const _routes = [
    {'route': '/', 'title': 'Home'},
    {'route': '/about_me/', 'title': 'About me'},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: _routes.length,
        itemBuilder: (context, index) {
          final element = _routes[index];
          final route = element['route']!;
          final title = element['title']!;
          return RouteTile(route: route, title: title);
        },
      ),
    );
  }
}
