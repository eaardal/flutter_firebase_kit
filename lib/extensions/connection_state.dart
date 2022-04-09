import 'package:flutter/material.dart';

extension ConnectionStates<T> on AsyncSnapshot<T> {
  bool get none {
    return connectionState == ConnectionState.none;
  }

  bool get waiting {
    return connectionState == ConnectionState.waiting;
  }

  bool get loading {
    return connectionState == ConnectionState.none ||
        connectionState == ConnectionState.waiting;
  }

  bool get active {
    return connectionState == ConnectionState.active;
  }

  bool get activeWithData {
    return connectionState == ConnectionState.active && hasData;
  }

  bool get done {
    return connectionState == ConnectionState.done;
  }

  bool get doneWithData {
    return connectionState == ConnectionState.done && hasData;
  }

  bool get finished {
    return connectionState == ConnectionState.active ||
        connectionState == ConnectionState.done;
  }

  bool get finishedWithData {
    return (connectionState == ConnectionState.active ||
            connectionState == ConnectionState.done) &&
        hasData;
  }
}
