import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
// import '/src/theme/theme_changer.dart';
import '/src/theme/theme_changer2.dart';

class HeadersPage7 extends StatelessWidget {
  const HeadersPage7({super.key});

  @override
  Widget build(BuildContext context) {
    // final appTheme = Provider.of<ThemeChanger>(context);
    final appTheme2 = ThemeChanger2Notifier.watch(context).currentTheme;

    return Scaffold(
      body: WaveGradientHeader(
        // color1: appTheme.currentTheme.colorScheme.primaryContainer,
        // color2: appTheme.currentTheme.colorScheme.inversePrimary,
        // color3: appTheme.currentTheme.colorScheme.primary,
        color1: appTheme2.colorScheme.primaryContainer,
        color2: appTheme2.colorScheme.inversePrimary,
        color3: appTheme2.colorScheme.primary,
      ),
    );
  }
}
