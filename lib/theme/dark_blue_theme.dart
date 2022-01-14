import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/theme/app_theme.dart';
import 'package:flutter_firebase_kit/utils/hex_utils.dart';

// Theme generated with https://bareynol.github.io/mui-theme-creator/.
// Export of the generated theme: <repo>/docs/dark_blue_theme.js.
// Field names in this class reflects the generated theme 1:1.
class DarkBlueTheme {
  static final Brightness type = Brightness.dark;

  static final Color backgroundDefault = HexUtils.colorFromHex("#050a2b");
  static final Color backgroundPaper = HexUtils.colorFromHex("#1e1848");

  static final Color textPrimary = HexUtils.colorFromHex("#f1eaf7");
  static final Color textSecondary = Color.fromRGBO(255, 255, 255, 0.7);
  static final Color textDisabled = Color.fromRGBO(255, 255, 255, 0.5);
  static final Color textHint = Color.fromRGBO(255, 255, 255, 0.5);

  static final Color primaryMain = HexUtils.colorFromHex("#bbdefb");
  static final Color primaryLight = Color.fromRGBO(200, 228, 251, 0);
  static final Color primaryDark = Color.fromRGBO(130, 155, 175, 0);
  static final Color primaryContrastText = Color.fromRGBO(0, 0, 0, 0.87);

  static final Color secondaryMain = HexUtils.colorFromHex("#82b1ff");
  static final Color secondaryLight = Color.fromRGBO(155, 192, 255, 0);
  static final Color secondaryDark = Color.fromRGBO(91, 123, 178, 0);
  static final Color secondaryContrastText = Color.fromRGBO(0, 0, 0, 0.87);

  static final Color errorMain = HexUtils.colorFromHex("#f44336");
  static final Color errorLight = HexUtils.colorFromHex("#e57373");
  static final Color errorDark = HexUtils.colorFromHex("#d32f2f");
  static final Color errorContrastText = HexUtils.colorFromHex("#ffffff");

  static final Color warningMain = HexUtils.colorFromHex("#ff9800");
  static final Color warningLight = HexUtils.colorFromHex("#ffb74d");
  static final Color warningDark = HexUtils.colorFromHex("#f57c00");
  static final Color warningContrastText = Color.fromRGBO(0, 0, 0, 0.87);

  static final Color infoMain = HexUtils.colorFromHex("#2196f3");
  static final Color infoLight = HexUtils.colorFromHex("#64b5f6");
  static final Color infoDark = HexUtils.colorFromHex("#1976d2");
  static final Color infoContrastText = HexUtils.colorFromHex("#ffffff");

  static final Color successMain = HexUtils.colorFromHex("#4caf50");
  static final Color successLight = HexUtils.colorFromHex("#81c784");
  static final Color successDark = HexUtils.colorFromHex("#388e3c");
  static final Color successContrastText = Color.fromRGBO(0, 0, 0, 0.87);

  static final Color divider = Color.fromRGBO(255, 255, 255, 0.1);

  static ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: backgroundDefault,
      dialogBackgroundColor: backgroundDefault,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundPaper,
      ),
      primaryColor: backgroundPaper,
      primaryColorLight: primaryLight,
      primaryColorDark: primaryDark,
      primaryColorBrightness: type,
      accentColor: secondaryMain,
      backgroundColor: backgroundDefault,
      colorScheme: ColorScheme(
        primary: primaryMain,
        primaryVariant: primaryLight,
        secondary: secondaryMain,
        secondaryVariant: secondaryLight,
        surface: backgroundPaper,
        background: backgroundDefault,
        error: errorMain,
        onPrimary: primaryContrastText,
        onSecondary: secondaryContrastText,
        onSurface: textPrimary,
        onBackground: textPrimary,
        onError: errorContrastText,
        brightness: type,
      ),
      cardColor: backgroundPaper,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cornerRadius),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cornerRadius),
        ),
      ),
      canvasColor: backgroundPaper,
      fontFamily: "Karla",

      // https://api.flutter.dev/flutter/material/TextTheme-class.html
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 96,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightLight,
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          fontSize: 60,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightLight,
          letterSpacing: -0.5,
        ),
        headline3: TextStyle(
          fontSize: 48,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 0,
        ),
        headline4: TextStyle(
          fontSize: 34,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 0.25,
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 0,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightMedium,
          letterSpacing: 0.15,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightMedium,
          letterSpacing: 0.1,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 0.5,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 0.25,
        ),
        button: TextStyle(
          fontSize: 14,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightMedium,
          letterSpacing: 1.25,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 0.4,
        ),
        overline: TextStyle(
          fontSize: 11,
          fontFamily: AppTheme.font.familyName,
          fontWeight: AppTheme.font.fontWeightRegular,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
