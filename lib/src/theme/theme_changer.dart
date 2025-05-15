import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        // _currentTheme = ThemeData.dark().copyWith(
        //   colorScheme: const ColorScheme.dark(
        //     primary: Colors.blue,
        //     secondary: Colors.green,
        //   ),
        // );
        break;
      case 3: // custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        // _currentTheme = ThemeData(
        //   primaryColor: const Color(0xff615AAB),
        //   colorScheme: const ColorScheme.light(primary: Color(0xff615AAB)),
        //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //     backgroundColor: Color(0xff615AAB),
        //   ),
        //   appBarTheme: const AppBarTheme(
        //     color: Color(0xff615AAB),
        //     centerTitle: false,
        //     elevation: 0,
        //   ),
        // );
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    _customTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark();
      // _currentTheme = ThemeData.dark().copyWith(
      //   colorScheme: const ColorScheme.dark(
      //     primary: Colors.blue,
      //     secondary: Colors.green,
      //   ),
      // );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff48A0EB),
          inversePrimary: Color(0xFF6FE4F9),
          primaryContainer: Color.fromARGB(255, 8, 136, 249),
          secondary: Colors.grey,
        ),
        scaffoldBackgroundColor: const Color(0xff16202B),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
