import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../infrastructure/logger.dart';

abstract class Google {
  Future<AuthCredential?> logIn();
  Future<void> logOut();
}

class GoogleAuth extends Google {
  final Logger _log;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  GoogleAuth(this._log);

  Future<AuthCredential?> logIn() async {
    _log.i("logging in to google");
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _log.e("failed to sign in to google: returned user is null");
        return null;
      }
      var creds = await googleUser.authCredentials();
      _log.i("logged in to google");
      return creds;
    } on Exception catch (exception, stackTrace) {
      _log.e("could not sign in to google", exception, stackTrace);
      return null;
    }
  }

  Future<void> logOut() async {
    _log.i("logging out from google");
    try {
      await _googleSignIn.signOut();
      _log.i("logged out from google");
    } on Exception catch (exception, stackTrace) {
      _log.e("could not log out from google", exception, stackTrace);
    }
  }
}

extension Credentials on GoogleSignInAccount? {
  Future<AuthCredential?> authCredentials() async {
    if (this == null) {
      return Future.value(null);
    }

    final auth = await this?.authentication;
    if (auth == null) {
      return Future.value(null);
    }

    if (auth.accessToken == null || auth.idToken == null) {
      return Future.value(null);
    }

    return GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
  }
}

class MockGoogle with Google {
  @override
  Future<AuthCredential?> logIn() async {
    return AuthCredential(
      providerId: "Provider",
      signInMethod: "Mock",
      token: 666,
    );
  }

  @override
  Future<void> logOut() async {}
}
