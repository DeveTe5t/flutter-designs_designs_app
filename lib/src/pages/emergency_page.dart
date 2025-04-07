import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        title: 'Medical assistence',
        subTitle: 'You have requested',
        backgroundColor1: Colors.deepPurple,
        backgroundColor2: Colors.blue,
        beginGradient: Alignment.topCenter,
        endGradient: Alignment.bottomCenter,
      ),
    );
  }
}
