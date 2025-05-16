import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
// import '/src/theme/theme_changer.dart';
import '/src/theme/theme_changer2.dart';

class HeadersPage1 extends StatelessWidget {
  const HeadersPage1({super.key});

  @override
  Widget build(BuildContext context) {
    // final appTheme = Provider.of<ThemeChanger>(context);
    final appTheme2 = ThemeChanger2Notifier.watch(context).currentTheme;

    return Scaffold(
      // body: SquareHeader(color: appTheme.currentTheme.colorScheme.primary),
      body: SquareHeader(color: appTheme2.colorScheme.primary),
    );
  }
}
