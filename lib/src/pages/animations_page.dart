import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    // return const _Square();
    return AnimatedBuilder(
      animation: controller,
      // child: _Square(),
      builder: (BuildContext context, Widget? child) {
        // print(rotation.value);
        return Transform.rotate(angle: rotation.value, child: _Square());
        // child: child,
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
