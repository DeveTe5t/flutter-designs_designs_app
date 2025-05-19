import 'package:flutter/material.dart';

/// Tema Claro Estándar
final ThemeData kLightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    primary: Colors.pink,
    secondary: Colors.black,
  ),
);

/// Tema Oscuro Estándar
final ThemeData kDarkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    primary: Colors.pink,
    secondary: Colors.white,
  ),
);

/// Tema "Custom dark" (Originalmente un tema oscuro con colores azules)
final ThemeData kCustomTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff48A0EB),
    inversePrimary: Color(0xFF6FE4F9),
    primaryContainer: Color(0xFF0888F9),
    secondary: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xff16202B),
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
);

/// Tema "Custom Light"
final ThemeData kCustomLightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    primary: Color(0xff48A0EB),
    secondary: Colors.black,
  ),
  scaffoldBackgroundColor: const Color(0xFFFEFFFF),
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
);
