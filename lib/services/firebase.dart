import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as Sdk;
import 'package:firebase_storage/firebase_storage.dart';

import '../infrastructure/logger.dart';

abstract class Firebase {
  FirebaseAuth get auth;
  FirebaseFirestore get firestore;
  FirebaseStorage get storage;

  String get userId;
  Stream<bool> get isLoggedIn;

  Future<User?> logIn(AuthCredential authCredential);
  Future<void> logOut();
}

class FirebaseAdmin extends Firebase {
  final Logger _log;

  FirebaseAdmin(this._log);

  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  String get userId => auth.currentUser!.uid;
  Stream<bool> get isLoggedIn =>
      auth.authStateChanges().map((user) => user != null);

  Future<User?> logIn(AuthCredential authCredential) async {
    _log.i("logging in to firebase using credential [$authCredential]");
    try {
      var userCredential = await auth.signInWithCredential(authCredential);
      _log.i("logged in to firebase");
      return userCredential.user;
    } on Exception catch (exception, stackTrace) {
      _log.e("could not log in to firebase using credential [$authCredential]",
          exception, stackTrace);
      return null;
    }
  }

  Future<void> logOut() async {
    _log.i("logging out from firebase");
    try {
      await auth.signOut();
      _log.i("logged out from firebase");
    } on Exception catch (exception, stackTrace) {
      _log.e("could not log out from firebase", exception, stackTrace);
    }
  }

  static init() async {
    await Sdk.Firebase.initializeApp();
  }

  static void useLocalEmulator(int port) {
    String host = Platform.isAndroid
        ? '10.0.2.2:$port' // Android emulator needs this IP for referencing localhost
        : 'localhost:$port'; // The port must match 'firestore' in firebase.json.

    FirebaseFirestore.instance.settings = Settings(
      host: host,
      sslEnabled: false,
      persistenceEnabled: false,
    );

    print("==============================================");
    print("");
    print("Using Firebase Emulators");
    print("Dashboard: http://localhost:{dashboardPort}");
    print("Firestore: http://localhost:{dashboardPort}/firestore");
    print("");
    print("==============================================");
  }
}

class MockFirebase with Firebase {
  @override
  FirebaseAuth get auth => throw UnimplementedError();

  @override
  FirebaseFirestore get firestore => throw UnimplementedError();

  @override
  FirebaseStorage get storage => throw UnimplementedError();

  @override
  Stream<bool> get isLoggedIn => throw UnimplementedError();

  @override
  String get userId => throw UnimplementedError();

  @override
  Future<User?> logIn(AuthCredential authCredential) {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }
}
