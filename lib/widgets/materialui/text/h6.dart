import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class H6 extends AdjustableText {
  H6(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.headline6,
          style: style,
        );
}
