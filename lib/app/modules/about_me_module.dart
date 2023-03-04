import 'package:flutter_modular/flutter_modular.dart';

import '../core/utils/transitions.dart';
import 'pages/about_me_page.dart';

class AboutMeModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => AboutMePage(),
          transition: TransitionType.custom,
          customTransition: routeTransition,
        )
      ];
}
