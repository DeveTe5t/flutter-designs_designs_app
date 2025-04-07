import 'package:flutter/material.dart';

// import '/src/pages/animations_page.dart';
// import '/src/challenges/animated_square_page.dart';
// import 'src/labs/circular_progress_page.dart';
// import '/src/widgets/headers.dart';
// import '/src/pages/circle_graphic_page.dart';
// import 'src/labs/slide_show_page.dart';
// import 'src/pages/slide_show_page.dart';
// import '/src/pages/pinterest_page.dart';
import '/src/pages/emergency_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff615AAB)),
      ),
      // home: const SlideShowPage(),
      // home: const PinterestPage(),
      home: const EmergencyPage(),
    );
  }
}
