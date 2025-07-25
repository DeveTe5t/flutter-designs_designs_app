import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage2 extends StatelessWidget {
  const HeadersPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(
      body: RoundedCornersHeader(color: appTheme.colorScheme.primary),
    );
  }
}
