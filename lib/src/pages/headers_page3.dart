import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage3 extends StatelessWidget {
  const HeadersPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(body: DiagonalHeader(color: appTheme.colorScheme.primary));
  }
}
