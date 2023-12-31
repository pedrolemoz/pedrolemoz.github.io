import 'package:flutter/material.dart';

import 'pages/initial_page.dart';
import 'utils/theme.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const InitialPage(),
    );
  }
}
