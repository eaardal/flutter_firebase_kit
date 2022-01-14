import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class H4 extends AdjustableText {
  H4(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.headline4,
        );
}
