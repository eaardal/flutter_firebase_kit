import 'dart:ui';

import 'font.dart';

/*
Add font to pubspec.yaml (also copy assets/fonts/heebo/):
  fonts:
    - family: Heebo
      fonts:
        - asset: assets/fonts/heebo/Heebo-Thin.ttf
          weight: 100
        - asset: assets/fonts/heebo/Heebo-ExtraLight.ttf
          weight: 200
        - asset: assets/fonts/heebo/Heebo-Light.ttf
          weight: 300
        - asset: assets/fonts/heebo/Heebo-Regular.ttf
          weight: 400
        - asset: assets/fonts/heebo/Heebo-Medium.ttf
          weight: 500
        - asset: assets/fonts/heebo/Heebo-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/heebo/Heebo-Bold.ttf
          weight: 700
        - asset: assets/fonts/heebo/Heebo-ExtraBold.ttf
          weight: 800
 */
class FontHeebo implements Font {
  String get familyName => "Heebo";
  FontWeight get fontWeightLight => FontWeight.w300;
  FontWeight get fontWeightRegular => FontWeight.w400;
  FontWeight get fontWeightMedium => FontWeight.w500;
  FontWeight get fontWeightBold => FontWeight.w700;
}
