import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils/routes.dart';

class RouteTile extends StatelessWidget {
  final Routes route;

  const RouteTile({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(route.title),
      onTap: () {
        final routeName = Modular.to.path;
        if (routeName == route.value) {
          Modular.to.maybePop();
        } else {
          Modular.to.pushReplacementNamed(route.value);
        }
      },
    );
  }
}
