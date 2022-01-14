import 'package:flutter/cupertino.dart';

/*
Add fonts to pubspec.yaml:
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
abstract class Font {
  String get familyName;
  FontWeight get fontWeightLight;
  FontWeight get fontWeightRegular;
  FontWeight get fontWeightMedium;
  FontWeight get fontWeightBold;
}
