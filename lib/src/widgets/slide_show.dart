import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  final double dotPrimarySize;
  final double dotSecondarySize;
  const SlideShow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.dotPrimaryColor = Colors.blue,
    this.dotSecondaryColor = Colors.grey,
    this.dotPrimarySize = 12,
    this.dotSecondarySize = 12,
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
              return _CreateSlideShowStructure(dotsUp: dotsUp, slides: slides);
            },
          ),
          // child: _CreateSlideShowStructure(dotsUp: dotsUp, slides: slides),
        ),
      ),
    );
  }
}

class _CreateSlideShowStructure extends StatelessWidget {
  const _CreateSlideShowStructure({required this.dotsUp, required this.slides});

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsUp) _Dots(slides.length),

        Expanded(child: _Slides(slides)),

        if (!dotsUp) _Dots(slides.length),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalDots, (i) => _Dot(i)),
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
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      // listen: false in initState
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page ?? 0;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
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
  Color dotPrimaryColor = Colors.blue;
  Color dotSecondaryColor = Colors.grey;
  double dotPrimarySize = 12;
  double dotSecondarySize = 12;

  double get currentPage => _currentPage;
  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
