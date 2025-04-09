import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/widgets/headers.dart';
import '/src/widgets/fat_button.dart';

class _ItemButton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  _ItemButton(this.icon, this.text, this.color1, this.color2, this.onPressed);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentOrientation = MediaQuery.of(context).orientation;
    // other way to do it
    // OrientationBuilder(
    //   builder: (context, orientation) {
    //     // we check the orientation
    //     if (orientation == Orientation.portrait) {
    //       // We're vertical (Portrait)
    //       return _buildPortraitLayout();
    //     } else {
    //       // We're horizontal mode (Landscape)
    //       return _buildLandscapeLayout();
    //     }
    //   },
    // ),

    final items = <_ItemButton>[
      _ItemButton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
        () {
          print('Hey: Motor Accident');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
        () {
          print('Hey: Medical Emergency');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
        () {
          print('Hey: Theft / Harrasement');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
        () {
          print('Hey: Awards');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
        () {
          print('Hey: Motor Accident');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
        () {
          print('Hey: Medical Emergency');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
        () {
          print('Hey: Theft / Harrasement');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
        () {
          print('Hey: Awards');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
        () {
          print('Hey: Motor Accident');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
        () {
          print('Hey: Medical Emergency');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
        () {
          print('Hey: Theft / Harrasement');
        },
      ),
      _ItemButton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
        () {
          print('Hey: Awards');
        },
      ),
    ];

    List<Widget> itemMap =
        items
            .map(
              (item) => FatButton(
                icon: item.icon,
                title: item.text,
                backgroundColor1: item.color1,
                backgroundColor2: item.color2,
                onPressed: item.onPressed,
              ),
            )
            .toList();

    return Scaffold(
      // body: Stack(
      //   children: [
      //     // way 1: it can be better, not seems work in horizantal screen
      //     // bacause add currentOrientation
      //     // Container(
      //     //   margin: EdgeInsets.only(
      //     //     top: currentOrientation == Orientation.portrait ? 240 : 300,
      //     //   ),
      //     //   child: ListView(children: itemMap),
      //     // ),
      //     // way 2: better to way 1 and similar to way 3 but more explicit
      //     // in horizontal screen, it start behind the icon header
      //     // Positioned(
      //     //   top: currentOrientation == Orientation.portrait ? 240 : 300,
      //     //   left: 0,
      //     //   right: 0,
      //     //   bottom: 0,
      //     //   child: ListView(children: itemMap),
      //     // ),
      //     // way 3: a little better than way 2
      //     ListView(
      //       // Real space height IconHeader
      //       padding: const EdgeInsets.only(top: 300),
      //       children: itemMap,
      //     ),
      //     const PageHeader(),
      //   ],
      // ),

      // way 4: using slivers
      body: CustomScrollView(
        slivers: <Widget>[
          // Sliver 1: El Encabezado (usando SliverAppBar o SliverPersistentHeader)
          SliverAppBar(
            // Para mantenerlo siempre visible en la parte superior
            pinned: true,
            // No flotante para que no reaparezca al hacer scroll hacia arriba
            floating: false,
            // expandedHeight: 250.0, // Altura deseada del área del header
            expandedHeight:
                currentOrientation == Orientation.portrait
                    ? 240.0
                    : 300.0, // Altura deseada del área del header
            // O el color de fondo que prefieras
            backgroundColor: Colors.transparent,
            flexibleSpace: const FlexibleSpaceBar(background: PageHeader()),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return itemMap[index];
            }, childCount: itemMap.length),
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
      // backgroundColor1: Colors.blue,
      // backgroundColor2: Colors.deepPurple,

      // backgroundColor1: Colors.blueAccent,
      // backgroundColor2: Colors.green,
      // backgroundColor1: Colors.green,
      // backgroundColor2: Colors.blueAccent,
      beginGradient: Alignment.topCenter,
      endGradient: Alignment.bottomCenter,
    );
  }
}
