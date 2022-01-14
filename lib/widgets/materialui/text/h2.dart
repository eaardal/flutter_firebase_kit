import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class H2 extends AdjustableText {
  H2(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.headline2,
          style: style,
        );
}
