import 'package:flutter/rendering.dart';

import 'brand_colors.dart';

class BrandTypography {
  static const defaultText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.2,
    letterSpacing: -0.1,
    color: BrandColors.black,
  );

  static TextStyle body = defaultText.copyWith(
    fontSize: 17,
    letterSpacing: -0.1,
  );
  static TextStyle bodyBold = body.copyWith(
    fontWeight: FontWeight.bold,
  );

  static TextStyle title = defaultText.copyWith(
    fontSize: 24,
    //fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );
}
