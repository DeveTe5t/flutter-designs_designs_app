import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquareHeader extends StatelessWidget {
  final Color color;
  const SquareHeader({super.key, this.color = const Color(0xff615AAB)});

  @override
  Widget build(BuildContext context) {
    return Container(height: 300, color: color);
  }
}

class RoundedCornersHeader extends StatelessWidget {
  final Color color;
  const RoundedCornersHeader({super.key, this.color = const Color(0xff615AAB)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  final Color color;
  const DiagonalHeader({super.key, this.color = const Color(0xff615AAB)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderDiagonalPainter(color)),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  final Color color;
  _HeaderDiagonalPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = color; // const Color(0xff615AAB);
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
  final Color color;
  const TriangleHeader({super.key, this.color = const Color(0xff615AAB)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderTrianglePainter(color)),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  final Color color;
  _HeaderTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = color; // const Color(0xff615AAB);
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
  final Color color;
  const PointedHeader({super.key, this.color = const Color(0xff615AAB)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderPointedPainter(color)),
    );
  }
}

class _HeaderPointedPainter extends CustomPainter {
  final Color color;
  _HeaderPointedPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = color; // const Color(0xff615AAB);
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
  final Color color;
  const CurvedHeader({super.key, this.color = const Color(0xff615AAB)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvedPainter(color)),
    );
  }
}

class _HeaderCurvedPainter extends CustomPainter {
  final Color color;
  _HeaderCurvedPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = color; // const Color(0xff615AAB);
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
  final Color color;
  const WaveHeader({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavePainter(color)),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;
  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = color; // const Color(0xff615AAB);
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
  final Color color;
  const WaveBottomHeader({super.key, this.color = const Color(0xff615AAB)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWaveBottomPainter(color)),
    );
  }
}

class _HeaderWaveBottomPainter extends CustomPainter {
  final Color color;
  _HeaderWaveBottomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Properties
    paint.color = color; // const Color(0xff615AAB);
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
  final Color color1;
  final Color color2;
  final Color color3;

  const WaveGradientHeader({
    super.key,
    this.color1 = const Color(0xff6D05E8),
    this.color2 = const Color(0xffC012FF),
    this.color3 = const Color(0xff6D05FA),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(color1, color2, color3),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  final Color color1;
  final Color color2;
  final Color color3;

  _HeaderWaveGradientPainter(this.color1, this.color2, this.color3);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180,
    );

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // colors: <Color>[Color(0xff6D05E8), Color(0xffC012FF), Color(0xff6D05FA)],
      colors: <Color>[color1, color2, color3],
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
