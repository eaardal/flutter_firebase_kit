import 'package:flutter_firebase_kit/models/firestore_model.dart';

abstract class Model {
  fromMap(Map<String, dynamic> data);

  Map<String, dynamic> toMap();

  String toString() {
    return "${this.runtimeType.toString()}(${toMap()})";
  }
}

extension ToModel<T extends FirestoreModel> on T {
  E toModel<E extends Model>(E Function() modelCreator) {
    return modelCreator()..fromMap(toMap());
  }
}

extension ToModels<T extends FirestoreModel> on Iterable<T> {
  Iterable<E> toModels<E extends Model>(E Function() modelCreator) {
    return map((T document) => document.toModel(modelCreator));
  }
}

extension MapModel<T extends FirestoreModel> on Stream<T> {
  Stream<E> mapModel<E extends Model>(E Function() modelCreator) {
    return map((T document) => document.toModel(modelCreator));
  }
}

extension MapModels<T extends FirestoreModel> on Stream<Iterable<T>> {
  Stream<Iterable<E>> mapModels<E extends Model>(E Function() modelCreator) {
    return map((Iterable<T> documents) => documents.toModels(modelCreator));
  }
}
