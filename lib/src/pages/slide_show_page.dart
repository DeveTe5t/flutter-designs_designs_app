import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/src/widgets/slide_show.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Scaffold(body: SlideShow());
    return Scaffold(
      body: SlideShow(
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          // const Center(child: Text('Heya!')),
          // Container(width: 200, height: 200, color: Colors.blue),
        ],
      ),
    );
  }
}
