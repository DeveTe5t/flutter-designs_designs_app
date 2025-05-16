import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import '/src/widgets/slide_show.dart';
// import '/src/theme/theme_changer.dart';
import '/src/theme/theme_changer2.dart';

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
    // final appTheme = Provider.of<ThemeChanger>(context);
    final appTheme2 = ThemeChanger2Notifier.watch(context);

    return SlideShow(
      // dotsUp: true,
      // dotPrimaryColor: Colors.green,
      // dotPrimaryColor:
      //     appTheme.darkTheme
      //         ? appTheme.currentTheme.colorScheme.primary
      //         : Colors.blue,
      // dotPrimaryColor: appTheme.currentTheme.colorScheme.primary,
      dotPrimaryColor: appTheme2.currentTheme.colorScheme.primary,
      // dotSecondaryColor: Colors.black26,
      dotPrimarySize: 20,
      dotSecondarySize: 12,
      autoMoveConfig: const AutoMoveConfig(
        loop: true,
        duration: Duration(milliseconds: 2500),
      ),
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
