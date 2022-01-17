import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/infrastructure/bloc.dart';
import 'package:flutter_firebase_kit/services/session.dart';

class GoogleLoginScreen extends StatelessWidget {
  final String logInButtonText;

  const GoogleLoginScreen({
    Key? key,
    required this.logInButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GoogleLoginScreenBloc>(
      bloc: context.createBloc<GoogleLoginScreenBloc>(),
      child: _GoogleLoginScreen(
        logInButtonText: this.logInButtonText,
      ),
    );
  }
}

class _GoogleLoginScreen extends StatefulWidget {
  final String logInButtonText;

  const _GoogleLoginScreen({
    Key? key,
    required this.logInButtonText,
  }) : super(key: key);

  @override
  _GoogleLoginScreenState createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<_GoogleLoginScreen> {
  bool isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    var bloc = context.getBloc<GoogleLoginScreenBloc>();
    Widget body = OutlinedButton(
      child: Text(widget.logInButtonText),
      onPressed: () async {
        setState(() {
          isLoggingIn = true;
        });
        await bloc.logIn();
      },
    );

    if (isLoggingIn) {
      body = CircularProgressIndicator();
    }

    return Scaffold(
      body: Container(
        child: Center(
          child: body,
        ),
      ),
    );
  }
}

class GoogleLoginScreenBloc extends Bloc {
  final Session _session;

  GoogleLoginScreenBloc(this._session);

  Stream<bool> get loggedIn => _session.isLoggedIn;

  @override
  void dispose() {}

  Future<void> logIn() async {
    await _session.logIn();
  }
}
