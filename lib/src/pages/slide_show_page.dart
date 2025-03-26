import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/src/widgets/slide_show.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Scaffold(body: SlideShow());
    return const Scaffold(
      // backgroundColor: Colors.purple,
      body: Column(
        children: [
          Expanded(child: MySlideShow()),
          Expanded(child: MySlideShow()),
        ],
      ),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      // dotsUp: true,
      // dotPrimaryColor: Colors.green,
      // dotSecondaryColor: Colors.black26,
      dotPrimarySize: 20,
      dotSecondarySize: 12,
      // autoMove: true,
      // autoMove['loop']: true,
      // autoMove['duration']: const Duration(seconds: 2),
      autoMove: {'loop': true, 'duration': const Duration(milliseconds: 2500)},
      slides: [
        // SvgPicture.asset('assets/svgs/slide-1.svg'),
        // SvgPicture.asset('assets/svgs/slide-2.svg'),
        // SvgPicture.asset('assets/svgs/slide-3.svg'),
        // SvgPicture.asset('assets/svgs/slide-4.svg'),
        // SvgPicture.asset('assets/svgs/slide-5.svg'),
        SvgPicture.asset('assets/svgs/slide-6.svg'),
        SvgPicture.asset('assets/svgs/slide-7.svg'),
        SvgPicture.asset('assets/svgs/slide-8.svg'),
        SvgPicture.asset('assets/svgs/slide-9.svg'),
        SvgPicture.asset('assets/svgs/slide-10.svg'),
        SvgPicture.asset('assets/svgs/slide-11.svg'),
        SvgPicture.asset('assets/svgs/slide-12.svg'),
        // const Center(child: Text('Heya!')),
        // Container(width: 200, height: 200, color: Colors.blue),
        // const Center(child: Text('Heya2!')),
        // const Center(child: Text('Heya3!')),
        // const Center(child: Text('Heya4!')),
        // const Center(child: Text('Heya5!')),
        // const Center(child: Text('Heya6!')),
        // const Center(child: Text('Heya7!')),
      ],
    );
  }
}

// class AutoMoveConfig {
//   final bool loop;
//   final Duration duration;

//   AutoMoveConfig({this.loop = false, this.duration = const Duration(seconds: 2)});
// }

// class SlideShow extends StatelessWidget {
//   final List<Widget> slides;
//   final bool dotsUp;
//   final Color dotPrimaryColor;
//   final Color dotSecondaryColor;
//   final double dotPrimarySize;
//   final double dotSecondarySize;
//   final AutoMoveConfig autoMove;

//   const SlideShow({
//     super.key,
//     required this.slides,
//     this.dotsUp = false,
//     this.dotPrimaryColor = Colors.blue,
//     this.dotSecondaryColor = Colors.grey,
//     this.dotPrimarySize = 12,
//     this.dotSecondarySize = 12,
//     this.autoMove = const AutoMoveConfig(),
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Usar el objeto autoMove aquí
//     return Container(); // Ejemplo de widget
//   }
// }
