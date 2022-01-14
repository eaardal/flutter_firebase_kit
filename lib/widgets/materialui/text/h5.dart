import 'package:flutter/material.dart';

import 'adjustable_text.dart';

class H5 extends AdjustableText {
  H5(
    String text, {
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextStyle? style,
  }) : super(
          text: text,
          padding: padding,
          margin: margin,
          theme: (context) => Theme.of(context).textTheme.headline5,
          style: style,
        );
}
