import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(children: [Expanded(child: _Slides()), _Dots()]),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      // color: Colors.blue,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_Dot(), _Dot(), _Dot()],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  const _Slides();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          const _Slide('assets/svgs/slide-1.svg'),
          const _Slide('assets/svgs/slide-2.svg'),
          const _Slide('assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
