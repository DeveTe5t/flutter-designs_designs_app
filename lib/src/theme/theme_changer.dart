import 'package:flutter/material.dart';
import 'theme_definitions.dart';

enum AppThemeType { light, dark, custom }

class ThemeChanger with ChangeNotifier {
  // bool _darkTheme = false;
  // bool _customTheme = false;
  // ThemeData _currentTheme = ThemeData.light();

  // bool get darkTheme => _darkTheme;
  // bool get customTheme => _customTheme;
  // ThemeData get currentTheme => _currentTheme;

  // ThemeChanger(AppThemeType theme) {
  //   switch (theme) {
  //     case AppThemeType.light: // light
  //       _darkTheme = false;
  //       _customTheme = false;
  //       _currentTheme = ThemeData.light().copyWith(
  //         // colorScheme: ColorScheme.fromSeed(
  //         //   seedColor: Colors.pink,
  //         //   secondary: Colors.black,
  //         // ),
  //         colorScheme: const ColorScheme.light(
  //           primary: Colors.pink,
  //           // inversePrimary: Color(0xFF6FE4F9),
  //           // primaryContainer: Color(0xFF0888F9),
  //           secondary: Colors.black,
  //         ),
  //       );
  //       break;
  //     case AppThemeType.dark: // dark
  //       _darkTheme = true;
  //       _customTheme = false;
  //       _currentTheme = ThemeData.dark().copyWith(
  //         colorScheme: const ColorScheme.dark(
  //           primary: Colors.pink,
  //           // inversePrimary: Color(0xFF6FE4F9),
  //           // primaryContainer: Color(0xFF0888F9),
  //           secondary: Colors.white,
  //         ),
  //       );
  //       break;
  //     case AppThemeType.custom: // custom
  //       _darkTheme = false;
  //       _customTheme = true;
  //       // _currentTheme = ThemeData.light();
  //       _currentTheme = ThemeData.dark().copyWith(
  //         colorScheme: const ColorScheme.dark(
  //           primary: Color(0xff48A0EB),
  //           inversePrimary: Color(0xFF6FE4F9),
  //           primaryContainer: Color(0xFF0888F9),
  //           secondary: Colors.white,
  //         ),
  //         scaffoldBackgroundColor: const Color(0xff16202B),
  //         textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  //       );
  //       break;
  //   }
  // }

  // set darkTheme(bool value) {
  //   if (_darkTheme == value) return;

  //   _darkTheme = value;
  //   _customTheme = false;

  //   if (value) {
  //     _currentTheme = ThemeData.dark().copyWith(
  //       colorScheme: const ColorScheme.dark(
  //         primary: Colors.pink,
  //         secondary: Colors.white,
  //       ),
  //     );
  //   } else {
  //     _currentTheme = ThemeData.light().copyWith(
  //       colorScheme: const ColorScheme.dark(
  //         primary: Colors.pink,
  //         secondary: Colors.black,
  //       ),
  //     );
  //   }

  //   notifyListeners();
  // }

  // set customTheme(bool value) {
  //   if (_customTheme == value) return;

  //   _customTheme = value;
  //   _darkTheme = false;

  //   if (value) {
  //     _currentTheme = ThemeData.dark().copyWith(
  //       colorScheme: const ColorScheme.dark(
  //         primary: Color(0xff48A0EB),
  //         inversePrimary: Color(0xFF6FE4F9),
  //         primaryContainer: Color(0xFF0888F9),
  //         // secondary: Colors.grey,
  //         secondary: Colors.white,
  //       ),
  //       scaffoldBackgroundColor: const Color(0xff16202B),
  //       textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  //     );
  //   } else {
  //     _currentTheme = ThemeData.light().copyWith(
  //       colorScheme: const ColorScheme.light(
  //         primary: Color(0xff48A0EB),
  //         // inversePrimary: Color(0xFF6FE4F9),
  //         // primaryContainer: Color(0xFF0888F9),
  //         secondary: Colors.black,
  //       ),
  //       scaffoldBackgroundColor: const Color(0xFFFEFFFF),
  //       textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
  //     );
  //   }

  //   notifyListeners();
  // }

  bool _darkTheme;
  bool _customTheme;
  ThemeData _currentTheme;

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(AppThemeType initialThemeType)
    : _darkTheme = false, // Valores iniciales que se sobrescribirán
      _customTheme = false,
      _currentTheme =
          kLightTheme // Tema por defecto antes de la lógica del constructor
          {
    // Establece el estado inicial basado en AppThemeType
    switch (initialThemeType) {
      case AppThemeType.light:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = kLightTheme;
        break;
      case AppThemeType.dark:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = kDarkTheme;
        break;
      case AppThemeType.custom:
        // Este es el tema personalizado "oscuro" por defecto
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = kCustomTheme;
        break;
    }
  }

  set darkTheme(bool value) {
    ThemeData newTheme;
    bool newDarkThemeState = value;
    bool newCustomThemeState = false; // darkTheme siempre desactiva customTheme

    if (newDarkThemeState) {
      newTheme = kDarkTheme;
    } else {
      newTheme = kLightTheme;
    }

    // Evitar notificaciones si el estado no cambia realmente
    if (_darkTheme == newDarkThemeState &&
        _customTheme == newCustomThemeState &&
        _currentTheme == newTheme) {
      return;
    }

    _darkTheme = newDarkThemeState;
    _customTheme = newCustomThemeState;
    _currentTheme = newTheme;
    notifyListeners();
  }

  set customTheme(bool value) {
    ThemeData newTheme;
    bool newCustomThemeState = value;
    bool newDarkThemeState = false; // customTheme siempre desactiva darkTheme

    if (newCustomThemeState) {
      newTheme = kCustomTheme; // Activar custom lleva al tema custom (oscuro)
    } else {
      // Desactivar custom lleva al tema "custom light"
      newTheme = kCustomLightTheme;
    }

    // Evitar notificaciones si el estado no cambia realmente
    if (_customTheme == newCustomThemeState &&
        _darkTheme == newDarkThemeState &&
        _currentTheme == newTheme) {
      return;
    }

    _customTheme = newCustomThemeState;
    _darkTheme = newDarkThemeState;
    _currentTheme = newTheme;
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
