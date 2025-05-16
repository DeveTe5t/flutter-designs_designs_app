import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage1 extends StatelessWidget {
  const HeadersPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(body: SquareHeader(color: appTheme.colorScheme.primary));
  }
}
