import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/src/theme/theme_changer.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: AnimatedSquare()));
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
  late Animation<double> opacityOut;
  late Animation<double> moveToRight;
  late Animation<double> enlarge;

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
        curve: const Interval(0, 0.25, curve: Curves.easeOut),
      ),
    ); // 0.25 of total duration 4000 milliseconds

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      // opacityOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    ); // 0.25 of total duration 4000 milliseconds

    moveToRight = Tween(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    enlarge = Tween(
      begin: 0.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.addListener(() {
      // print('Status: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        // controller.repeat();
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
      child: const _Square(),
      builder: (BuildContext context, Widget? childSquare) {
        // print('Opacity: ${opacity.value}');
        // print('Rotation: ${rotation.value}');
        // print(rotation.value);
        // return Transform.rotate(angle: rotation.value, child: _Square());
        return Transform.translate(
          offset: Offset(moveToRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: enlarge.value,
                // child: Opacity(opacity: opacityOut.value, child: childSquare),
                child: childSquare,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Square extends StatelessWidget {
  const _Square();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: appTheme.colorScheme.primary, // Colors.blue
      ),
    );
  }
}
