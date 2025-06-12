import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppFontSizes {
  fontSize8(8),
  fontSize10(10),
  fontSize12(12),
  fontSize13(13),
  fontSize14(14),
  fontSize15(15),
  fontSize16(16),
  fontSize18(18),
  fontSize20(20),
  fontSize22(22),
  fontSize24(24),
  fontSize26(26),
  fontSize28(28),
  fontSize30(30),
  fontSize32(32),
  fontSize36(36);

  final double value;

  const AppFontSizes(this.value);
}

extension AppFontSizesExtension on AppFontSizes {
  /// Reduce font size for screens whose width is smaller than the screen width size on the design.
  double getRelativeFontSize() {
    final FlutterView view =
        WidgetsBinding.instance.platformDispatcher.views.first;
    final double viewWidth = MediaQueryData.fromView(view).size.width;

    /// [screenWidthOfDesign] The width of the screen on design (e.g. Figma, AdobeXD, ...)
    // TODO(developer): update `screenWidthOfDesign` according to your design.
    const double screenWidthOfDesign = 390;
    final double scaleFactor = viewWidth / screenWidthOfDesign;
    return value * (kIsWeb ? 1 : scaleFactor);
  }
}
