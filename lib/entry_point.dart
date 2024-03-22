import 'package:flutter/material.dart';

import 'pages/initial_page.dart';
import 'pages/policy_page.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        '/': (context) => const InitialPage(),
        '/apps/smartnotes/policy/': (context) {
          return const PolicyPage(url: Routes.smartNotesPolicy);
        },
      },
    );
  }
}
