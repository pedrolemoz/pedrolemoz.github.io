import 'dart:ui';

extension LayoutExtension on Size {
  bool get isMobile => width < 870;
  bool get isDesktop => width >= 870;
}
