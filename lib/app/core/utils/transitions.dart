import 'package:animations/animations.dart';
import 'package:flutter_modular/flutter_modular.dart';

const _duration = Duration(milliseconds: 400);

final moduleTransition = CustomTransition(
  transitionDuration: _duration,
  transitionBuilder: (context, animation, secondaryAnimation, child) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  },
);

final routeTransition = CustomTransition(
  transitionDuration: _duration,
  transitionBuilder: (context, animation, secondaryAnimation, child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.horizontal,
      child: child,
    );
  },
);
