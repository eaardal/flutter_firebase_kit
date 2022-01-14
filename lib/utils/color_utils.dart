import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  static Color getRandomColor() {
    var colors = [
      Colors.red,
      Colors.yellow,
      Colors.cyan,
      Colors.green,
      Colors.pink,
      Colors.purple,
      Colors.blue,
      Colors.orange,
      Colors.greenAccent
    ];
    var rnd = Random();
    var num = rnd.nextInt(colors.length - 1);
    return colors[num];
  }
}
