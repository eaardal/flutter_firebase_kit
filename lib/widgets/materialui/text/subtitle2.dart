import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class Subtitle2 extends AdjustableText {
  Subtitle2(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.subtitle2,
          style: style,
        );
}
