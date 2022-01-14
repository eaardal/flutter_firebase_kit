import 'package:uuid/uuid.dart';

class IdUtil {
  static String newId() {
    return Uuid().v4();
  }
}
