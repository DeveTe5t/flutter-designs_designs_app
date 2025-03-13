import 'package:flutter/material.dart';

class CircleGraphicPage extends StatefulWidget {
  const CircleGraphicPage({super.key});

  @override
  State<CircleGraphicPage> createState() => _CircleGraphicPageState();
}

class _CircleGraphicPageState extends State<CircleGraphicPage> {
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$percent %', style: const TextStyle(fontSize: 50)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percent += 10;
            if (percent > 100) {
              percent = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
