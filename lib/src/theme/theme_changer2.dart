import 'package:flutter/material.dart';

class ThemeChanger2 with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger2(int theme) {
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
        break;
      case 3: // custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    if (value == _darkTheme) return;

    _darkTheme = value;
    _customTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    if (value == _customTheme) return;

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

class ThemeChanger2Notifier extends InheritedNotifier<ThemeChanger2> {
  const ThemeChanger2Notifier({
    super.key,
    required ThemeChanger2 model,
    required super.child,
  }) : super(notifier: model);

  static ThemeChanger2 watch(BuildContext context) {
    final notifier =
        context
            .dependOnInheritedWidgetOfExactType<ThemeChanger2Notifier>()
            ?.notifier;
    assert(notifier != null, 'No ThemeChanger2 found in context');
    return notifier!;
  }

  static ThemeChanger2 read(BuildContext context) {
    final widget =
        context
            .getElementForInheritedWidgetOfExactType<ThemeChanger2Notifier>()
            ?.widget;
    assert(widget != null, 'No ThemeChanger2 found in context');
    return (widget as ThemeChanger2Notifier).notifier!;
  }
}
