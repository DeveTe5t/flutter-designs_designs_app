import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AnimatedSquare()));
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    ); // Curves.bounceOut

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.25, curve: Curves.easeOut),
      ),
    ); // 0.25 of total duration 4000 milliseconds

    controller.addListener(() {
      print('Status: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
      // else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    // controller.repeat();

    // return const _Square();
    return AnimatedBuilder(
      animation: controller,
      // child: _Square(),
      child: _Square(),
      builder: (BuildContext context, Widget? childSquare) {
        // print(rotation.value);
        // return Transform.rotate(angle: rotation.value, child: _Square());
        return Transform.rotate(
          angle: rotation.value,
          child: Opacity(opacity: opacity.value, child: childSquare),
        );
      },
    );
  }
}

class _Square extends StatelessWidget {
  const _Square();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
