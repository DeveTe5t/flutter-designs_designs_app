import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/widgets/headers.dart';
import '/src/theme/theme_changer.dart';
// import '/src/pages/animations_page.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    // return const Scaffold(body: AnimationsPage());
    return Scaffold(
      body: WaveHeader(
        color: appTheme.currentTheme.colorScheme.primary, // inversePrimary,
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
