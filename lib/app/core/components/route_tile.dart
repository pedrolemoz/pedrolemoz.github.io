import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouteTile extends StatelessWidget {
  final String route;
  final String title;

  const RouteTile({super.key, required this.route, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        final routeName = Modular.to.path;
        if (routeName == route) {
          Modular.to.maybePop();
        } else {
          Modular.to.pushReplacementNamed(route);
        }
      },
    );
  }
}
