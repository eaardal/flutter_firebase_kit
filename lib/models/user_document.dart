import 'package:flutter_firebase_kit/models/firestore_model.dart';

class UserDocument extends FirestoreModel {
  String? name;
  String? email;
  String? pictureUrl;

  UserDocument({this.name, this.email, this.pictureUrl});

  UserDocument.fromSnapshotData(Map<String, dynamic> data) {
    withSnapshotData(data);
  }

  @override
  withSnapshotData(Map<String, dynamic> data) {
    this.name = data["name"];
    this.email = data["email"];
    this.pictureUrl = data["pictureUrl"];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "pictureUrl": pictureUrl,
    };
  }
}
