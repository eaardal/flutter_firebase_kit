import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class OverlineText extends AdjustableText {
  OverlineText(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text.toUpperCase(),
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.overline,
          style: style,
        );
}
