import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/widgets/headers.dart';
import '/src/widgets/fat_button.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PageHeader()
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 250),
            child: ListView(
              children: const [
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
                FatButtonTemp(),
              ],
            ),
          ),
          const IconHeader(
            icon: FontAwesomeIcons.plus,
            title: 'Medical assistence',
            subTitle: 'You have requested',
            backgroundColor1: Colors.blueAccent,
            backgroundColor2: Colors.green,
          ),
        ],
      ),
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  const FatButtonTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return FatButton(
      // icon: FontAwesomeIcons.carBurst,
      title: 'Motor Accident',
      backgroundColor1: Colors.blue,
      backgroundColor2: Colors.deepPurple,
      onPressed: () {
        print('hey');
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Medical assistence',
      subTitle: 'You have requested',
      backgroundColor1: Colors.deepPurple,
      backgroundColor2: Colors.blue,
      beginGradient: Alignment.topCenter,
      endGradient: Alignment.bottomCenter,
    );
  }
}
