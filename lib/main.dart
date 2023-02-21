import 'package:flutter/material.dart';

import 'pages/about_me_page.dart';
import 'pages/work_information.dart';
import 'settings/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  Route _routeTransition(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == Routes.workInformation.value) {
          return _routeTransition(WorkInformation());
        }

        return _routeTransition(AboutMePage());
      },
    );
  }
}
