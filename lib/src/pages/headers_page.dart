import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
// import '/src/theme/theme_changer.dart';
// import '/src/pages/animations_page.dart';
import '/src/theme/theme_changer2.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final appTheme = Provider.of<ThemeChanger>(context);
    final appTheme2 = ThemeChanger2Notifier.watch(context).currentTheme;

    // return const Scaffold(body: AnimationsPage());
    return Scaffold(
      body: WaveHeader(
        // color: appTheme.currentTheme.colorScheme.primary, // inversePrimary,
        color: appTheme2.colorScheme.primary, // inversePrimary,
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
