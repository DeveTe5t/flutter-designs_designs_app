import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    // return const Scaffold(body: AnimationsPage());
    return Scaffold(
      body: WaveHeader(
        color: appTheme.colorScheme.primary, // inversePrimary,
        // color:
        //     appTheme.darkTheme
        //         ? appTheme.currentTheme.colorScheme.onPrimary
        //         : appTheme.currentTheme.colorScheme.inversePrimary, // primary,
      ),
    );
    // return const Scaffold(body: WaveBottomHeader());
    // return const Scaffold(body: WaveGradientHeader());
  }
}
