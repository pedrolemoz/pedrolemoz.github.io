import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/transitions.dart';
import 'pages/work_experience_page.dart';

class WorkExperienceModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const WorkExperiencePage(),
          transition: TransitionType.custom,
          customTransition: routeTransition,
        ),
      ];
}
