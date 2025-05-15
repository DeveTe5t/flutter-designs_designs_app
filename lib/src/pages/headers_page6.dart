import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage6 extends StatelessWidget {
  const HeadersPage6({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: CurvedHeader(color: appTheme.currentTheme.colorScheme.primary),
    );
  }
}
