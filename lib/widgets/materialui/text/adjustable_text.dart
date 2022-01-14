import 'package:flutter/material.dart';

class AdjustableText extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? style;
  final Function(BuildContext context)? theme;

  AdjustableText({
    required this.text,
    this.style,
    this.padding,
    this.margin,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? style = this.style;

    if (theme != null) {
      // If we have a theme, use the theme as the base styling
      style = theme!(context);

      // If a specific style was provided, merge the base style (theme) with this
      if (this.theme != null) {
        style = style!.merge(this.style);
      }
    }

    return Container(
      padding: this.padding,
      margin: this.margin,
      child: Text(
        this.text,
        style: style,
      ),
    );
  }
}
