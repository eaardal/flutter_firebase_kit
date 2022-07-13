import 'dart:ffi';

class FieldUtils {
  static Float? toOptionalFloat(Map<String, dynamic> data, String name) {
    try {
      if (data.containsKey(name)) {
        Float value = data[name];
        return value;
      }
      return null;
    } catch (e) {
      throw "field $name could not be read as a Float: $e";
    }
  }

  static Float toRequiredFloat(Map<String, dynamic> data, String name) {
    var value = toOptionalFloat(data, name);
    if (value == null) {
      throw "required field $name is null";
    }
    return value;
  }

  static double? toOptionalDouble(Map<String, dynamic> data, String name) {
    try {
      if (data.containsKey(name)) {
        // Dart might interpret a dynamic number as int even though we gave it a double,
        // in which case casting to double will throw an error. Parsing to string first,
        // then parsing that to double is a more robust approach.
        String value = data[name].toString();
        return double.tryParse(value);
      }
      return null;
    } catch (e) {
      throw "field $name could not be read as a double: $e";
    }
  }

  static double toRequiredDouble(Map<String, dynamic> data, String name) {
    var value = toOptionalDouble(data, name);
    if (value == null) {
      throw "required field $name is null";
    }
    return value;
  }

  static String? toOptionalString(Map<String, dynamic> data, String name) {
    try {
      if (data.containsKey(name)) {
        String value = data[name];
        return value;
      }
      return null;
    } catch (e) {
      throw "field $name could not be read as a String: $e";
    }
  }

  static String toRequiredString(Map<String, dynamic> data, String name) {
    var value = toOptionalString(data, name);
    if (value == null) {
      throw "required field $name is null";
    }
    return value;
  }

  static bool? toOptionalBool(Map<String, dynamic> data, String name) {
    try {
      if (data.containsKey(name)) {
        bool value = data[name];
        return value;
      }
      return null;
    } catch (e) {
      throw "field $name could not be read as a bool: $e";
    }
  }

  static bool toRequiredBool(Map<String, dynamic> data, String name) {
    var value = toOptionalBool(data, name);
    if (value == null) {
      throw "required field $name is null";
    }
    return value;
  }

  static int? toOptionalInt(Map<String, dynamic> data, String name) {
    try {
      if (data.containsKey(name)) {
        int value = data[name];
        return value;
      }
      return null;
    } catch (e) {
      throw "field $name could not be read as a int: $e";
    }
  }

  static int toRequiredInt(Map<String, dynamic> data, String name) {
    var value = toOptionalInt(data, name);
    if (value == null) {
      throw "required field $name is null";
    }
    return value;
  }

  static T? toOptionalObject<T>(
      Map<String, dynamic> data, String name, Mapper mapper) {
    try {
      if (data.containsKey(name)) {
        T value = mapper(data[name]);
        return value;
      }
      return null;
    } catch (e) {
      throw "field $name could not be mapped to ${T.runtimeType}: $e";
    }
  }

  static T toRequiredObject<T>(
      Map<String, dynamic> data, String name, Mapper mapper) {
    try {
      var value = toOptionalObject<T>(data, name, mapper);
      if (value == null) {
        throw "required field $name is null";
      }
      return value;
    } catch (e) {
      throw "field $name could not be mapped to ${T.runtimeType}: $e";
    }
  }

  static Iterable<T>? toOptionalObjects<T>(
      Map<String, dynamic> data, String name, Mapper mapper) {
    try {
      if (data.containsKey(name)) {
        print("value: ${data[name]}");
        dynamic val = data[name];
        var vv = cast<Iterable<Map<String, dynamic>>>(val)
        Iterable<T> values = vv.map<T>((entry) => mapper(entry));
        return values;
      }
      return null;
    } catch (e) {
      throw "field $name could not be mapped to ${T.runtimeType}: $e";
    }
  }

  static Iterable<T> toRequiredObjects<T>(
      Map<String, dynamic> data, String name, Mapper mapper) {
    try {
      var values = toOptionalObjects<T>(data, name, mapper);
      if (values == null) {
        throw "required field $name is null";
      }
      return values;
    } catch (e) {
      throw "field $name could not be mapped to ${T.runtimeType}: $e";
    }
  }
}

typedef T Mapper<T>(Map<String, dynamic> mapper);
