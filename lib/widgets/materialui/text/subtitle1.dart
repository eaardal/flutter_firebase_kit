import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class Subtitle1 extends AdjustableText {
  Subtitle1(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.subtitle1,
          style: style,
        );
}
