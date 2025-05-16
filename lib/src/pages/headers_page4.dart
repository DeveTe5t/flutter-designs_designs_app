import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage4 extends StatelessWidget {
  const HeadersPage4({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(body: TriangleHeader(color: appTheme.colorScheme.primary));
  }
}
