import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
// import '/src/theme/theme_changer.dart';
import '/src/theme/theme_changer2.dart';

class HeadersPage6 extends StatelessWidget {
  const HeadersPage6({super.key});

  @override
  Widget build(BuildContext context) {
    // final appTheme = Provider.of<ThemeChanger>(context);
    final appTheme2 = ThemeChanger2Notifier.watch(context).currentTheme;

    return Scaffold(
      // body: CurvedHeader(color: appTheme.currentTheme.colorScheme.primary),
      body: CurvedHeader(color: appTheme2.colorScheme.primary),
    );
  }
}
