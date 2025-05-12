import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '/src/pages/animations_page.dart';
// import '/src/challenges/animated_square_page.dart';
// import 'src/labs/circular_progress_page.dart';
// import '/src/widgets/headers.dart';
// import '/src/pages/circle_graphic_page.dart';
// import 'src/labs/slide_show_page.dart';
// import 'src/pages/slide_show_page.dart';
// import '/src/pages/pinterest_page.dart';
// import '/src/pages/emergency_page.dart';
// import 'src/pages/sliver_list_page.dart';
import '/src/theme/theme_changer.dart';
import '/src/pages/launcher_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(2),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs app',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff615AAB)),
      // ),
      theme: currentTheme,
      // home: const CircleGraphicPage(),
      // home: const SlideShowPage(),
      // home: const PinterestPage(),
      // home: const EmergencyPage(),
      // home: const SliverListPage(),
      home: const LauncherPage(),
    );
  }
}
