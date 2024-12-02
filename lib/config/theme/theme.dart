import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'PlusJakartaSans',
    scaffoldBackgroundColor: const Color(0x0fffffff),
    textTheme: _textTheme(),
    colorScheme: _colorScheme(),
    cupertinoOverrideTheme: _cupertinoOverrideTheme(),
  );
}

ColorScheme _colorScheme() {
  return ColorScheme.fromSeed(
    seedColor: const Color(0xFF7A5D3E),
  );
}

CupertinoThemeData _cupertinoOverrideTheme() {
  return const CupertinoThemeData(
    primaryColor: Color(0xFF7A5D3E),
  );
}

TextTheme _textTheme() {
  return const TextTheme(
    headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
  );
}
