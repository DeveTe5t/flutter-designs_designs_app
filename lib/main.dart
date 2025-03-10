import 'package:flutter/material.dart';

import '/src/pages/headers_page.dart';

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
      home: const HeadersPage(),
    );
  }
}
