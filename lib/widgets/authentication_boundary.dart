import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/infrastructure/bloc.dart';
import 'package:flutter_firebase_kit/services/session.dart';

class AuthenticationBoundary extends StatelessWidget {
  final Widget child;
  final Widget loginScreen;

  AuthenticationBoundary({required this.loginScreen, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: context.createBloc<AuthenticationBoundaryBloc>(),
      child: _AuthenticationBoundary(
        loginScreen: this.loginScreen,
        child: this.child,
      ),
    );
  }
}

class _AuthenticationBoundary extends StatelessWidget {
  final Widget child;
  final Widget loginScreen;

  _AuthenticationBoundary({required this.loginScreen, required this.child});

  @override
  Widget build(BuildContext context) {
    var bloc = context.getBloc<AuthenticationBoundaryBloc>();
    return StreamBuilder<bool>(
      stream: bloc.loggedIn,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return Container(color: Colors.white);
        }
        var loggedIn = snapshot.data ?? false;
        if (!loggedIn) {
          return this.loginScreen;
        }
        return this.child;
      },
    );
  }
}

class AuthenticationBoundaryBloc extends Bloc {
  final Session _session;

  AuthenticationBoundaryBloc(this._session);

  Stream<bool> get loggedIn => _session.isLoggedIn;

  @override
  void dispose() {}

  Future<void> logIn() async {
    await _session.logIn();
  }
}
