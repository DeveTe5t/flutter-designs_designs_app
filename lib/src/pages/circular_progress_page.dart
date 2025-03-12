import 'dart:math';

import 'package:flutter/material.dart';

class CircularPregressPage extends StatefulWidget {
  const CircularPregressPage({super.key});

  @override
  State<CircularPregressPage> createState() => _CircularPregressPageState();
}

class _CircularPregressPageState extends State<CircularPregressPage> {
  double percent = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.blue,
          child: CustomPaint(painter: _MyRadialProgress(percent)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percent;
  _MyRadialProgress(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    // The pencil
    final paint =
        Paint()
          ..strokeWidth = 4
          ..color = Colors.grey
          ..style = PaintingStyle.stroke;

    // Draw circle
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Draw arc
    final paintArc =
        Paint()
          ..strokeWidth = 10
          ..color = Colors.pink
          ..style = PaintingStyle.stroke;

    // Part to fill
    // 2 * pi = 360 degrees
    double arcAngle = 2 * pi * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
