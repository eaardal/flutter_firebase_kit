import 'dart:ui';

import 'font.dart';

/*
Add font to pubspec.yaml (also copy assets/fonts/heebo/):
  fonts:
    - family: Karla
      fonts:
        - asset: assets/fonts/karla/Karla-ExtraLight.ttf
          weight: 200
        - asset: assets/fonts/karla/Karla-ExtraLightItalic.ttf
          weight: 200
          style: italic
        - asset: assets/fonts/karla/Karla-Light.ttf
          weight: 300
        - asset: assets/fonts/karla/Karla-LightItalic.ttf
          weight: 300
          style: italic
        - asset: assets/fonts/karla/Karla-Regular.ttf
          weight: 400
        - asset: assets/fonts/karla/Karla-Italic.ttf
          weight: 400
          style: italic
        - asset: assets/fonts/karla/Karla-Medium.ttf
          weight: 500
        - asset: assets/fonts/karla/Karla-MediumItalic.ttf
          weight: 500
          style: italic
        - asset: assets/fonts/karla/Karla-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/karla/Karla-SemiBoldItalic.ttf
          weight: 600
          style: italic
        - asset: assets/fonts/karla/Karla-Bold.ttf
          weight: 700
        - asset: assets/fonts/karla/Karla-BoldItalic.ttf
          weight: 700
          style: italic
        - asset: assets/fonts/karla/Karla-ExtraBold.ttf
          weight: 800
        - asset: assets/fonts/karla/Karla-ExtraBoldItalic.ttf
          weight: 800
          style: italic
 */
class FontKarla implements Font {
  String get familyName => "Karla";
  FontWeight get fontWeightLight => FontWeight.w300;
  FontWeight get fontWeightRegular => FontWeight.w400;
  FontWeight get fontWeightMedium => FontWeight.w500;
  FontWeight get fontWeightBold => FontWeight.w700;
}
