import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Color? backgroundColor1;
  final Color? backgroundColor2;
  final VoidCallback onPressed;

  const FatButton({
    super.key,
    this.icon = FontAwesomeIcons.carBurst,
    required this.title,
    this.backgroundColor1 = const Color(0xff6989F5),
    this.backgroundColor2 = const Color(0xff906EF5),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    return InkWell(
      splashColor: backgroundColor1!.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(15),
      onTap: onPressed,
      child: Stack(
        children: [
          _FatButtonBackground(
            icon: icon!,
            backgroundColor1: backgroundColor1!,
            backgroundColor2: backgroundColor2!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40),
              // FaIcon(FontAwesomeIcons.carBurst, size: 40, color: Colors.white),
              FaIcon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor1;
  final Color backgroundColor2;

  const _FatButtonBackground({
    required this.icon,
    required this.backgroundColor1,
    required this.backgroundColor2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: const Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
          // colors: <Color>[Color(0xff6989F5), Color(0xff906EF5)],
          colors: <Color>[backgroundColor1, backgroundColor2],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                // FontAwesomeIcons.carBurst,
                icon,
                size: 150,
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
