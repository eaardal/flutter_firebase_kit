import 'package:flutter/cupertino.dart';

extension ScreenArguments<T> on BuildContext {
  T getArgs<T>() {
    // https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments
    var args = ModalRoute.of(this)!.settings.arguments;
    if (args == null) {
      throw Exception(
          "ScreenArguments: Unable to resolve arguments of type ${T.toString()}. Make sure arguments is set when navigating to a new screen");
    }
    return args as T;
  }
}
