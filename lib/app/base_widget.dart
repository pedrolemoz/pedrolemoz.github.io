import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}