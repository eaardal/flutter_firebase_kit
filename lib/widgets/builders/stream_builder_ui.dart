import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/infrastructure/ui.dart';

typedef Widget BuildWidgetWithUI<T extends UI>(
  BuildContext context,
  AsyncSnapshot<T> snapshot,
  T ui,
);

class StreamBuilderUI<T extends UI> extends StatelessWidget {
  final BuildWidgetWithUI<T>? none;
  final BuildWidgetWithUI<T>? waiting;
  final BuildWidgetWithUI<T>? noneOrWaiting;
  final BuildWidgetWithUI<T>? active;
  final BuildWidgetWithUI<T>? done;
  final T noneUI;
  final T waitingUI;
  final T noneOrWaitingUI;
  final T doneUI;
  final Stream<T> stream;

  StreamBuilderUI({
    this.none,
    this.waiting,
    this.noneOrWaiting,
    this.active,
    this.done,
    required this.noneUI,
    required this.waitingUI,
    required this.noneOrWaitingUI,
    required this.doneUI,
    required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: this.stream,
      builder: (context, snapshot) {
        var state =
            "StreamBuilderUI<${T.toString()}>: ${snapshot.connectionState.toString()}";
        print(state);

        var nothing = Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.red[200],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    state,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        );

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            if (none == null && noneOrWaiting == null) {
              return nothing;
            }
            if (noneOrWaiting != null) {
              return noneOrWaiting!(context, snapshot, noneOrWaitingUI);
            }
            return none!(context, snapshot, noneUI);
          case ConnectionState.waiting:
            if (none == null && noneOrWaiting == null) {
              return nothing;
            }
            if (noneOrWaiting != null) {
              return noneOrWaiting!(context, snapshot, noneOrWaitingUI);
            }
            return waiting!(context, snapshot, waitingUI);
          case ConnectionState.active:
            if (active == null || !snapshot.hasData) {
              return nothing;
            }
            return active!(context, snapshot, snapshot.data!);
          case ConnectionState.done:
            if (done == null) {
              return nothing;
            }
            return done!(context, snapshot, doneUI);
        }
      },
    );
  }
}
