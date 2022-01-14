import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class Bloc {
  void dispose();
  Stream<T> mergeStreams<T>(Iterable<Stream<T>> streams) {
    return StreamGroup.merge(streams);
  }
}

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({required this.bloc, required this.child});

  @override
  _BlocProviderState createState() => _BlocProviderState();

  static T of<T extends Bloc>(BuildContext context) {
    var provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    if (provider == null) {
      throw new Exception(
          "BlocProvider: No Bloc of type ${T.toString()} found");
    }
    return provider.bloc;
  }
}

class _BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class BlocFactory {
  final Map<Type, Function> _creators = Map();

  BlocFactory(Map<Type, Function> creators) {
    _creators.addAll(creators);
  }

  T create<T extends Bloc>() {
    final creator = _creators[T];
    if (creator == null) {
      throw new Exception(
          "BlocProvider: No creator for bloc of type ${T.toString()} found. It must be set up in BlocFactory before it can be used.");
    }
    return creator();
  }
}

extension BlocContext<T> on BuildContext {
  T getBloc<T extends Bloc>() {
    return BlocProvider.of<T>(this);
  }

  T createBloc<T extends Bloc>() {
    return Provider.of<BlocFactory>(this, listen: false).create<T>();
  }
}
