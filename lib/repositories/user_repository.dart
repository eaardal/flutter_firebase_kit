import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_kit/models/user_document.dart';

abstract class UserRepository {
  Future<void> createUser(
    String userId,
    String name,
    String email,
    String? pictureUrl,
  );
  Future<bool> userExists(String userId);
  void dispose();
}

class UserFirestoreRepository extends UserRepository {
  FirebaseFirestore _firestore;

  UserFirestoreRepository(this._firestore);

  @override
  Future<void> createUser(
      String userId, String name, String email, String? pictureUrl) async {
    var user = UserDocument(
      name: name,
      email: email,
      pictureUrl: pictureUrl,
    );
    await _firestore.collection("users").doc(userId).set(user.toMap());
  }

  @override
  Future<bool> userExists(String userId) async {
    try {
      var doc = await _firestore.collection("users").doc(userId).get();
      return doc.exists;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  void dispose() {}
}
