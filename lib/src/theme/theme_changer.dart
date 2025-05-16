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
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff48A0EB),
          inversePrimary: Color(0xFF6FE4F9),
          primaryContainer: Color(0xFF0888F9),
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

class ThemeChangerNotifier extends InheritedNotifier<ThemeChanger> {
  const ThemeChangerNotifier({
    super.key,
    required ThemeChanger model,
    required super.child,
  }) : super(notifier: model);

  static ThemeChanger watch(BuildContext context) {
    final notifier =
        context
            .dependOnInheritedWidgetOfExactType<ThemeChangerNotifier>()
            ?.notifier;
    assert(notifier != null, 'No ThemeChanger found in context');
    return notifier!;
  }

  static ThemeChanger read(BuildContext context) {
    final widget =
        context
            .getElementForInheritedWidgetOfExactType<ThemeChangerNotifier>()
            ?.widget;
    assert(widget is ThemeChangerNotifier, 'No ThemeChanger found in context');
    return (widget as ThemeChangerNotifier).notifier!;
  }
}
