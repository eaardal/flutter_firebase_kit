import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/theme/dark_blue_theme.dart';
import 'package:flutter_firebase_kit/theme/font_heebo.dart';

import 'font.dart';
import 'font_karla.dart';

class AppTheme {
  static ThemeData _theme = DarkBlueTheme.theme();
  static ThemeData get current => _theme;

  static void setTheme(ThemeData theme) {
    _theme = theme;
  }

  // The default corner radius on cards, buttons and other square UI elements.
  static final double cornerRadius = 20;

  // The default spacing distance for "1 unit".
  // Instead of specifying specific pixels as margins, padding and distance,
  // use this number as the base distance and multiply it to get more distance.
  //
  // This makes the UI more consistent as we avoid one card having 15px padding
  // while another has 20px padding. Instead they would both use space*2 to
  // get their padding.
  //
  // Use AppTheme.spacing(int units) to calculate the distance using this value.
  static final int space = 8;

  // The default padding between the border or edge of the screen/box/container to the content it contains.
  static final double contentPadding = space * 2;

  // The default font, used unless there are specific exceptions.
  static final Font font = FontKarla();

  // The font for body1 and body2 texts.
  static final Font bodyFont = FontHeebo();

  // Multiplies the underlying default spacing number and produces the actual
  // margin, padding or distance you should use.
  //
  // This makes the UI more consistent as we avoid one UI element having 15px padding
  // while another has 20px padding or other arbitrary numbers.
  //
  // Since the default spacing is 8 pixels, we should use AppTheme.spacing(2)
  // to get 16 pixels as the correct distance, or AppTheme.spacing(3) to get 24, and so on.
  static double spacing(int units) {
    return (space * units).toDouble();
  }

  // Shortcut for applying AppTheme.spacing(units) to all sides of a new EdgeInset.
  static EdgeInsets marginAll(int units) {
    return EdgeInsets.all(spacing(units).toDouble());
  }
}
