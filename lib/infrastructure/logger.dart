import 'dart:convert';

abstract class Logger {
  i(String msg);
  w(String msg);
  e(String msg, [Exception? exception, StackTrace? stackTrace]);
  inspect(Object obj);
}

class FlexLogger implements Logger {
  @override
  w(String msg) {
    print(msg);
  }

  @override
  i(String msg) {
    print(msg);
  }

  @override
  e(String msg, [Exception? exception, StackTrace? stackTrace]) {
    print(msg);

    if (exception != null) {
      print(exception);
    }

    if (stackTrace != null) {
      print(stackTrace);
    }
  }

  @override
  inspect(Object obj) {
    Map jsonMapped = json.decode(json.encode(obj));
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyPrint = encoder.convert(jsonMapped);
    this.i(prettyPrint);
  }
}
