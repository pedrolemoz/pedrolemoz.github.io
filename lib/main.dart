import 'package:flutter/material.dart';

import 'entry_point.dart';
import 'packages/service_locator/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.registerInstances();
  runApp(const EntryPoint());
}
