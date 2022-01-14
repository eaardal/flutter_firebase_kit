import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class Body1 extends AdjustableText {
  Body1(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.bodyText1,
          style: style,
        );
}
