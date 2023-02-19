import 'package:flutter/material.dart';

import '../settings/routes.dart';

class RouteTile extends StatelessWidget {
  final Routes route;

  const RouteTile({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(route.title),
      onTap: () {
        final settings = ModalRoute.of(context)?.settings;
        if (settings != null && settings.name == route.value) {
          Navigator.maybePop(context);
        } else {
          Navigator.pushReplacementNamed(context, route.value);
        }
      },
    );
  }
}
