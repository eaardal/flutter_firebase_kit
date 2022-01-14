import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_kit/repositories/user_repository.dart';

import '../infrastructure/logger.dart';
import 'firebase.dart';
import 'google.dart';

abstract class Session {
  Future<void> logIn();
  Future<void> logOut();
  Stream<bool> get isLoggedIn;
  String get userId;
}

class UserSession implements Session {
  final Google _google;
  final Firebase _firebase;
  final Logger _log;
  final UserRepository _userRepository;

  UserSession(
    this._google,
    this._firebase,
    this._log,
    this._userRepository,
  );

  Stream<bool> get isLoggedIn => _firebase.isLoggedIn;

  String get userId => _firebase.userId;

  Future<void> logIn() async {
    User? user;
    String userId;

    try {
      user = await _logIn();
      userId = user!.uid;
    } on Exception catch (ex) {
      _log.e("failed to login user", ex);
      return;
    }

    var userExists = await _userRepository.userExists(userId);
    if (userExists) {
      _log.i("user $userId exists");
      return;
    }

    _log.i("user $userId does not exist, creating");

    try {
      await _createUser(user);
    } on Exception catch (ex) {
      _log.e("failed to create user $userId in firestore", ex);
    }

    _log.i("created user $userId in firestore");
  }

  Future<User?> _logIn() async {
    var creds = await _google.logIn();
    if (creds == null) {
      throw new Exception("google login failed: credential is null");
    }

    var user = await _firebase.logIn(creds);
    if (user == null) {
      throw new Exception("firebase login failed: user is null");
    }

    _log.i("login complete");
    return user;
  }

  Future<void> _createUser(User user) async {
    if (user.displayName == null) {
      throw new Exception("user.displayName is null");
    }

    if (user.email == null) {
      throw new Exception("user.email is null");
    }

    await _userRepository.createUser(
      user.uid,
      user.displayName!,
      user.email!,
      user.photoURL,
    );
  }

  Future<void> logOut() async {
    await _firebase.logOut();
    await _google.logOut();
  }
}

class MockSession with Session {
  @override
  Stream<bool> get isLoggedIn => Stream.value(true);

  @override
  Future<void> logIn() async {}

  @override
  Future<void> logOut() async {}

  @override
  String get userId => "Bob";
}
