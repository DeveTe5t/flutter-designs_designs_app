import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double strockWidthPrimary;
  final double strockWidthSecondary;
  const RadialProgress({
    super.key,
    required this.percent,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.strockWidthPrimary = 10,
    this.strockWidthSecondary = 4,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double beforePercent;

  @override
  void initState() {
    super.initState();

    beforePercent = widget.percent;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final differenceAnimate = widget.percent - beforePercent;
    beforePercent = widget.percent;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              (widget.percent - differenceAnimate) +
                  (differenceAnimate * controller.value),
              widget.primaryColor,
              widget.secondaryColor,
              widget.strockWidthPrimary,
              widget.strockWidthSecondary,
            ),
          ),
        );
      },
      // child: ,
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double strockWidthPrimary;
  final double strockWidthSecondary;
  _MyRadialProgress(
    this.percent,
    this.primaryColor,
    this.secondaryColor,
    this.strockWidthPrimary,
    this.strockWidthSecondary,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // The pencil
    final paint =
        Paint()
          ..strokeWidth = strockWidthSecondary
          ..color =
              secondaryColor //Colors.grey
          ..style = PaintingStyle.stroke;

    // Draw circle
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Added
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 0.0),
      radius: 180,
    );

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // colors: <Color>[Color(0xffC012FF), Color(0xff6D05E8), Colors.red],
      // colors: <Color>[
      //   primaryColor.withRed(Random().nextInt(255)),
      //   primaryColor.withGreen(Random().nextInt(255)),
      //   primaryColor.withBlue(Random().nextInt(255)),
      // ],
      colors: <Color>[
        primaryColor.withRed(255),
        primaryColor.withBlue(255),
        primaryColor.withGreen(255),
      ],
      // relation between colors and offset
      stops: [0.3, 0.5, 1.0],
    );

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;
    // Added

    // Draw arc
    final paintArc =
        Paint()
          ..strokeWidth = strockWidthPrimary
          ..strokeCap = StrokeCap.round
          // ..color = primaryColor //Colors.pink
          ..style = PaintingStyle.stroke
          ..shader = gradient.createShader(rect);

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
