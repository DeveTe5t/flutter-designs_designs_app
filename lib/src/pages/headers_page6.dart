import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage6 extends StatelessWidget {
  const HeadersPage6({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(body: CurvedHeader(color: appTheme.colorScheme.primary));
  }
}
