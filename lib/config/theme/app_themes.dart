// Flutter imports:
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFF040D12),
    appBarTheme: _appBarTheme(),
  );
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}
