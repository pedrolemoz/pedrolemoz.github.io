import 'package:flutter/material.dart';

import 'pages/about_me_page.dart';
import 'pages/work_information.dart';
import 'settings/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.aboutMe.value: (context) => AboutMePage(),
        Routes.workInformation.value: (context) => WorkInformation(),
      },
    );
  }
}
