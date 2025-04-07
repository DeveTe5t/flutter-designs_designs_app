import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 300, color: const Color(0xff615AAB));
  }
}

class RoundedCornersHeader extends StatelessWidget {
  const RoundedCornersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    // stroke = border, fill = background
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    // Draw with the path and paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangleHeader extends StatelessWidget {
  const TriangleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderTrianglePainter()),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    // Draw with the path and paint
    // paint above part
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // close the path, but it's working without it
    // path.lineTo(0, 0);

    // paint down part
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // // close the path, but it's working without it
    // // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PointedHeader extends StatelessWidget {
  const PointedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderPointedPainter()),
    );
  }
}

class _HeaderPointedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    // Draw with the path and paint
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.50, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvedPainter()),
    );
  }
}

class _HeaderCurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    // Draw with the path and paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.40,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaveHeader extends StatelessWidget {
  const WaveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavePainter()),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    // Draw with the path and paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.50,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );

    // path.cubicTo(
    //   size.width * 0.40,
    //   size.height * 0.30,
    //   size.width * .60,
    //   size.height * 0.20,
    //   size.width,
    //   size.height * 0.25,
    // );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaveBottomHeader extends StatelessWidget {
  const WaveBottomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWaveBottomPainter()),
    );
  }
}

class _HeaderWaveBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    // Draw with the path and paint
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    // down to up
    // path.quadraticBezierTo(
    //   size.width * 0.25,
    //   size.height * 0.80,
    //   size.width * 0.50,
    //   size.height * 0.75,
    // );
    // path.quadraticBezierTo(
    //   size.width * 0.75,
    //   size.height * 0.70,
    //   size.width,
    //   size.height * 0.75,
    // );
    // up to down
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.70,
      size.width * 0.50,
      size.height * 0.75,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.80,
      size.width,
      size.height * 0.75,
    );

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaveGradientHeader extends StatelessWidget {
  const WaveGradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWaveGradientPainter()),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180,
    );

    final Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff6D05E8), Color(0xffC012FF), Color(0xff6D05FA)],
      // relation between colors and offset
      stops: [0.2, 0.5, 1.0],
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    // Properties
    // paint.color = Colors.blue; //Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20.0;

    final path = Path();

    // Draw with the path and paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.50,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// ------------ For emergency page
class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color backgroundColor1;
  final Color backgroundColor2;
  final AlignmentGeometry beginGradient;
  final AlignmentGeometry endGradient;

  const IconHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    // this.backgroundColor1 = const Color(0xff526BF6),
    // this.backgroundColor2 = const Color(0xff67ACF2),
    this.backgroundColor1 = Colors.deepPurple,
    this.backgroundColor2 = Colors.blue,
    this.beginGradient = Alignment.topCenter,
    this.endGradient = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    final whiteColor = Colors.white.withValues(alpha: 0.7);

    return Stack(
      children: [
        _IconHeaderBackground(
          backgroundColor1: backgroundColor1,
          backgroundColor2: backgroundColor2,
          beginGradient: beginGradient,
          endGradient: endGradient,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        Column(
          spacing: 20,
          children: [
            // double.infinity to fill the width and then center the content
            const SizedBox(height: 80, width: double.infinity),
            Text(subTitle, style: TextStyle(fontSize: 20, color: whiteColor)),
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            FaIcon(icon, size: 80, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final AlignmentGeometry beginGradient;
  final AlignmentGeometry endGradient;
  const _IconHeaderBackground({
    required this.backgroundColor1,
    required this.backgroundColor2,
    required this.beginGradient,
    required this.endGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: beginGradient,
          end: endGradient,
          colors: <Color>[backgroundColor1, backgroundColor2],
        ),
      ),
    );
  }
}
