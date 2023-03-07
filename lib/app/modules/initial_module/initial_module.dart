import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/transitions.dart';
import 'pages/initial_page.dart';

class InitialModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => InitialPage(),
          transition: TransitionType.custom,
          customTransition: routeTransition,
        )
      ];
}
