import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage4 extends StatelessWidget {
  const HeadersPage4({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: TriangleHeader(color: appTheme.currentTheme.colorScheme.primary),
    );
  }
}
