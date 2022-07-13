class MappingUtils {
  static T throwIfNull<T>(T? value, String name) {
    if (value == null) {
      throw "required field $name is null";
    }
    return value;
  }
}
