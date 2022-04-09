import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/screens/google_login_screen.dart';
import 'package:flutter_firebase_kit/widgets/authentication_boundary.dart';

class Screen extends StatelessWidget {
  final Widget? private;
  final Widget? public;

  const Screen({Key? key, this.private, this.public}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (private == null && public == null) {
      throw new Exception(
          "Layout requires either a private or public widget but both was null");
    }

    if (private != null && public != null) {
      throw new Exception(
          "Layout requires either a private or public widget but both was provided at the same time");
    }

    if (private != null) {
      return AuthenticationBoundary(
        loginScreen: GoogleLoginScreen(logInButtonText: "Log in with Google"),
        child: private!,
      );
    }

    return public!;
  }
}
