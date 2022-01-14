import 'package:flutter/material.dart';

abstract class AsyncWidget<T> {
  Widget error(BuildContext context, AsyncSnapshot<T> snapshot);
  Widget loading(BuildContext context, AsyncSnapshot<T> snapshot);
  Widget success(BuildContext context, AsyncSnapshot<T> snapshot);
  Widget empty(BuildContext context, AsyncSnapshot<T> snapshot);

  render(BuildContext context, AsyncSnapshot<T> snapshot) {
    if (snapshot.hasError) {
      return error(context, snapshot);
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return empty(context, snapshot);
      case ConnectionState.waiting:
        return loading(context, snapshot);
      case ConnectionState.active:
      case ConnectionState.done:
        return success(context, snapshot);
    }
  }
}

abstract class AsyncWidgetWithBloc<TData, TBloc> {
  Widget error(BuildContext context, AsyncSnapshot<TData> snapshot, TBloc bloc);
  Widget loading(
      BuildContext context, AsyncSnapshot<TData> snapshot, TBloc bloc);
  Widget success(
      BuildContext context, AsyncSnapshot<TData> snapshot, TBloc bloc);
  Widget empty(BuildContext context, AsyncSnapshot<TData> snapshot, TBloc bloc);

  render(BuildContext context, AsyncSnapshot<TData> snapshot, TBloc bloc) {
    if (snapshot.hasError) {
      return error(context, snapshot, bloc);
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return empty(context, snapshot, bloc);
      case ConnectionState.waiting:
        return loading(context, snapshot, bloc);
      case ConnectionState.active:
      case ConnectionState.done:
        return success(context, snapshot, bloc);
    }
  }
}
