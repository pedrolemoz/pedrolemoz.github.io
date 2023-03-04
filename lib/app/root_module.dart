import 'package:flutter_modular/flutter_modular.dart';

import 'core/utils/transitions.dart';
import 'modules/about_me_module/about_me_module.dart';
import 'modules/initial_module/initial_module.dart';

class RootModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: InitialModule(),
          transition: TransitionType.custom,
          customTransition: moduleTransition,
        ),
        ModuleRoute(
          '/about_me',
          module: AboutMeModule(),
          transition: TransitionType.custom,
          customTransition: moduleTransition,
        ),
      ];
}
