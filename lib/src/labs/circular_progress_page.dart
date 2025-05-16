import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '/src/theme/theme_changer.dart';

class CircularPregressPage extends StatefulWidget {
  const CircularPregressPage({super.key});

  @override
  State<CircularPregressPage> createState() => _CircularPregressPageState();
}

class _CircularPregressPageState extends State<CircularPregressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double percent = 0.0;
  double newPercent = 0.0;
  // late Animation<double> animationPercent;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    controller.addListener(() {
      // print('controller value: $controller.value');
      percent = lerpDouble(percent, newPercent, controller.value) ?? 0;
      // percent = lerpDouble(percent, newPercent, controller.value)!;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context);

    // animationPercent = Tween(
    //   begin: percent,
    //   end: newPercent,
    // ).animate(controller);

    return Scaffold(
      // body: AnimatedBuilder(
      //   animation: controller,
      //   builder: (BuildContext context, Widget? child) {
      //     return Center(
      //       child: Container(
      //         padding: const EdgeInsets.all(5),
      //         width: 300,
      //         height: 300,
      //         // color: Colors.blue,
      //         child: CustomPaint(painter: _MyRadialProgress(percent)),
      //       ),
      //     );
      //   },
      // ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.blue,
          child: CustomPaint(
            painter: _MyRadialProgress(
              percent: percent,
              primaryColor: appTheme.currentTheme.colorScheme.primary,
              secondaryColor: appTheme.currentTheme.colorScheme.secondary,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percent = newPercent;
          newPercent += 10;
          if (newPercent > 100) {
            newPercent = 0;
            percent = 0;
          }

          controller.forward(from: 0.0);

          setState(() {});
        },
        backgroundColor: appTheme.currentTheme.colorScheme.primary,
        child: Icon(
          Icons.refresh,
          color: appTheme.darkTheme ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percent;
  final Color primaryColor;
  final Color secondaryColor;

  _MyRadialProgress({
    required this.percent,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // The pencil
    final paint =
        Paint()
          ..strokeWidth = 4
          // ..color = Colors.grey
          ..color = secondaryColor
          ..style = PaintingStyle.stroke;

    // Draw circle
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Draw arc
    final paintArc =
        Paint()
          ..strokeWidth = 10
          // ..color = Colors.pink
          ..color = primaryColor
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
