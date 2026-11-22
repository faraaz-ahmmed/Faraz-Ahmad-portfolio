
import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static const double mobile = 600;
  static const double tablet = 1024;

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < mobile;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= mobile && width < tablet;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= tablet;
  }
}
