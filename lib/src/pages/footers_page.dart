import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class FootersPage extends StatelessWidget {
  const FootersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(
      body: WaveBottomHeader(color: appTheme.colorScheme.primary),
    );
  }
}
