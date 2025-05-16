import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage7 extends StatelessWidget {
  const HeadersPage7({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(
      body: WaveGradientHeader(
        color1: appTheme.colorScheme.primaryContainer,
        color2: appTheme.colorScheme.inversePrimary,
        color3: appTheme.colorScheme.primary,
      ),
    );
  }
}
