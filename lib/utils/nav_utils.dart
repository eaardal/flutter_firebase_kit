import 'package:flutter/material.dart';

class NavUtils {
  static void popTimes(BuildContext context, int times) {
    var count = 0;
    Navigator.popUntil(context, (route) => count++ == 2);
  }
}
