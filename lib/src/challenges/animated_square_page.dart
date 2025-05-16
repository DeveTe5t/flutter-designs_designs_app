import 'package:flutter/material.dart';
import '/src/theme/theme_changer.dart';

class AnimatedSquarePage extends StatelessWidget {
  const AnimatedSquarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: _AnimatedSquare()));
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare();

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );

    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut),
      ),
    );

    // moveLeft = Tween(begin: 0.0, end: -100.0).animate(
    moveLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut),
      ),
    );

    // moveDown = Tween(begin: 0.0, end: 100.0).animate(
    moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: const _Square(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(
            moveRight.value + moveLeft.value,
            moveUp.value + moveDown.value,
          ),
          child: child,
        );
      },
    );
  }
}

class _Square extends StatelessWidget {
  const _Square();

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Container(
      width: 70,
      height: 70,
      color: appTheme.colorScheme.primary, // Colors.blue
    );
  }
}
