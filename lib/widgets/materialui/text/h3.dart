import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class H3 extends AdjustableText {
  H3(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.headline3,
          style: style,
        );
}
