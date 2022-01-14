import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class Body2 extends AdjustableText {
  Body2(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.bodyText2,
          style: style,
        );
}
