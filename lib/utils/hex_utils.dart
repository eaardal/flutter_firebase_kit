import 'dart:ui';

class HexUtils {
  // Thanks to creativecreatorormaybenot @ https://stackoverflow.com/a/50081214
  static Color colorFromHex(String hexString) {
    assert(hexString.startsWith("#"));
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  // Thanks to creativecreatorormaybenot @ https://stackoverflow.com/a/50081214
  static String hexFromColor(Color color, {bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${color.alpha.toRadixString(16).padLeft(2, '0')}'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';
}
