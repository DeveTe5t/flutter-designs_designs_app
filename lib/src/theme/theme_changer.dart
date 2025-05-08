import 'package:flutter/widgets.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    _customTheme = false;
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    notifyListeners();
  }
}
