import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage5 extends StatelessWidget {
  const HeadersPage5({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Scaffold(body: PointedHeader(color: appTheme.colorScheme.primary));
  }
}
