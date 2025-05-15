import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class FootersPage extends StatelessWidget {
  const FootersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: WaveBottomHeader(color: appTheme.currentTheme.colorScheme.primary),
    );
  }
}
