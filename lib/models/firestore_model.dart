abstract class FirestoreModel {
  withSnapshotData(Map<String, dynamic> data);
  Map<String, dynamic> toMap();

  String toString() {
    return "${this.runtimeType.toString()}(${toMap()})";
  }
}
