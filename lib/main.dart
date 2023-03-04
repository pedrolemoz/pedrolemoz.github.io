import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/root_module.dart';
import 'app/root_widget.dart';

void main() => runApp(ModularApp(module: RootModule(), child: RootWidget()));
