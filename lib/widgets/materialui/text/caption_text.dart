import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class CaptionText extends AdjustableText {
  CaptionText(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.caption,
          style: style,
        );
}
