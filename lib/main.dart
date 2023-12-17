import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/base_module.dart';
import 'app/base_widget.dart';

void main() => runApp(
      ModularApp(
        module: BaseModule(),
        child: const BaseWidget(),
      ),
    );
