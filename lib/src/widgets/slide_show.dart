import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/models/slider_model.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  const SlideShow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.dotPrimaryColor = Colors.blue,
    this.dotSecondaryColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              if (dotsUp)
                _Dots(slides.length, dotPrimaryColor, dotSecondaryColor),

              Expanded(child: _Slides(slides)),

              if (!dotsUp)
                _Dots(slides.length, dotPrimaryColor, dotSecondaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalDots;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  const _Dots(this.totalDots, this.dotPrimaryColor, this.dotSecondaryColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: [for (int i = 0; i < totalDots; i++) _Dot(i)],
        children: List.generate(
          totalDots,
          (i) => _Dot(i, dotPrimaryColor, dotSecondaryColor),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  const _Dot(this.index, this.dotPrimaryColor, this.dotSecondaryColor);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color:
            (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
                ? dotPrimaryColor
                : dotSecondaryColor,
        shape: BoxShape.circle,
      ),
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
      // update provider or SlideModel
      // listen: false in initState
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
