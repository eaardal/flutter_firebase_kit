import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class H1 extends AdjustableText {
  H1(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.headline1,
          style: style,
        );
}
