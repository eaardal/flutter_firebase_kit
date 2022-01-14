import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class ButtonText extends AdjustableText {
  ButtonText(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text.toUpperCase(),
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.button,
          style: style,
        );
}
