import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  final double dotPrimarySize;
  final double dotSecondarySize;
  // final bool autoMove;
  final Map<String, dynamic> autoMove;
  const SlideShow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.dotPrimaryColor = Colors.blue,
    this.dotSecondaryColor = Colors.grey,
    this.dotPrimarySize = 12,
    this.dotSecondarySize = 12,
    // this.autoMove = false,
    // required this.autoMove = const {'loop': false, 'duration': Duration(seconds: 2)},
    required this.autoMove,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      // ..dotPrimaryColor = dotPrimaryColor
      // ..dotSecondaryColor = dotSecondaryColor
      // ..dotPrimarySize = dotPrimarySize
      // ..dotSecondarySize = dotSecondarySize,
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SliderModel>(context).dotPrimaryColor =
                  dotPrimaryColor;
              Provider.of<_SliderModel>(context).dotSecondaryColor =
                  dotSecondaryColor;
              Provider.of<_SliderModel>(context).dotPrimarySize =
                  dotPrimarySize;
              Provider.of<_SliderModel>(context).dotSecondarySize =
                  dotSecondarySize;
              Provider.of<_SliderModel>(context).dotsUp = dotsUp;
              Provider.of<_SliderModel>(context).autoMove = autoMove['loop'];
              Provider.of<_SliderModel>(context).autoMoveDuration =
                  autoMove['duration'];

              return _CreateSlideShowStructure(slides: slides);
            },
          ),
          // child: _CreateSlideShowStructure(slides: slides),
        ),
      ),
    );
  }
}

class _CreateSlideShowStructure extends StatelessWidget {
  const _CreateSlideShowStructure({required this.slides});

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    final slideDotsUp = Provider.of<_SliderModel>(context).dotsUp;
    return Column(
      children: [
        if (slideDotsUp) _Dots(slides.length),

        Expanded(child: _Slides(slides)),

        if (!slideDotsUp) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalDots;
  const _Dots(this.totalDots);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.0,
      // TODO: add scroll controller and move to shows last dots
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalDots, (i) => _Dot(i)),
            ),
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SliderModel>(context);

    final double size;
    final Color color;

    if (slideShowModel.currentPage >= index - 0.5 &&
        slideShowModel.currentPage < index + 0.5) {
      size = slideShowModel.dotPrimarySize;
      color = slideShowModel.dotPrimaryColor;
    } else {
      size = slideShowModel.dotSecondarySize;
      color = slideShowModel.dotSecondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final _pageViewController = PageController();
  late Timer _intervalSlider;
  int _currentPage = 0;
  late bool _autoMove;
  late Duration _autoMoveDuration;

  @override
  void initState() {
    super.initState();

    _autoMove = Provider.of<_SliderModel>(context, listen: false).autoMove;
    _autoMoveDuration =
        Provider.of<_SliderModel>(context, listen: false).autoMoveDuration;

    _pageViewController.addListener(() {
      // listen: false in initState
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          _pageViewController.page ?? 0;
    });

    if (!_autoMove) return;

    _intervalSlider = Timer.periodic(_autoMoveDuration, (timer) {
      // way 2
      if (_currentPage < widget.slides.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageViewController.animateToPage(
        _currentPage,
        duration: (_autoMoveDuration * 0.5),
        curve: Curves.easeInOut,
      );

      // way 1
      // if (pageViewController.page == widget.slides.length - 1) {
      //   pageViewController.jumpToPage(0);
      // } else {
      //   // No animation
      //   // pageViewController.jumpToPage(pageViewController.page!.toInt() + 1);

      //   // With animation
      //   // pageViewController.nextPage(
      //   //   duration: const Duration(milliseconds: 1000),
      //   //   curve: Curves.easeInOut,
      //   // );
      //   pageViewController.animateToPage(
      //     pageViewController.page!.toInt() + 1,
      //     duration: const Duration(milliseconds: 1000),
      //     curve: Curves.easeInOut,
      //   );
      // }
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _intervalSlider.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  bool dotsUp = false;
  Color dotPrimaryColor = Colors.blue;
  Color dotSecondaryColor = Colors.grey;
  double dotPrimarySize = 12;
  double dotSecondarySize = 12;
  bool autoMove = false;
  Duration autoMoveDuration = const Duration(seconds: 2);

  double get currentPage => _currentPage;
  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
