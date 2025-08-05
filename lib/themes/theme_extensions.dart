import 'package:flutter/material.dart';

var routeHolder = (route) => false;

extension ColorExt on String {
  Color fromHexToColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension HexExt on Color {
  String toHex() => '#${value.toRadixString(16)}';
}

extension ContextEct on BuildContext {
  ThemeData get theme => Theme.of(this);


  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  NavigatorState get nav => Navigator.of(this);

  bool get isDarkTheme =>
      ThemeData().brightness == Brightness.dark;
  bool get isLightTheme =>
      ThemeData().brightness == Brightness.light;
  bool get isSystemTheme =>
      ThemeData().brightness == Brightness.values;
}
