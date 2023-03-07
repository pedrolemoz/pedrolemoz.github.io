import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouteButton extends StatelessWidget {
  final String route;
  final String title;
  final bool boldTitle;

  const RouteButton({
    super.key,
    required this.route,
    required this.title,
    this.boldTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: boldTitle ? FontWeight.bold : null),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: () {
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
