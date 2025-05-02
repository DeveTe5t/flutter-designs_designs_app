import 'package:flutter/material.dart';

import '/src/widgets/headers.dart';
// import '/src/pages/animations_page.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Scaffold(body: AnimationsPage());
    return const Scaffold(body: WaveHeader());
    // return const Scaffold(body: WaveBottomHeader());
    // return const Scaffold(body: WaveGradientHeader());
  }
}
