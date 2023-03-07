import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouteTile extends StatelessWidget {
  final String route;
  final String title;
  final bool boldTitle;

  const RouteTile({
    super.key,
    required this.route,
    required this.title,
    this.boldTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: boldTitle ? FontWeight.bold : null),
      ),
      onTap: () {
        final routeName = Modular.to.path;
        if (routeName == route) {
          Modular.to.maybePop();
        } else {
          Modular.to.navigate(route);
        }
      },
    );
  }
}
