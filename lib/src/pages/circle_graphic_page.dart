import 'package:flutter/material.dart';

import '/src/widgets/radial_progress.dart';

class CircleGraphicPage extends StatefulWidget {
  const CircleGraphicPage({super.key});

  @override
  State<CircleGraphicPage> createState() => _CircleGraphicPageState();
}

class _CircleGraphicPageState extends State<CircleGraphicPage> {
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(percent: percent),
              CustomRadialProgress(
                percent: percent * 1.2,
                primaryColor: Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadialProgress(
                percent: percent * 1.4,
                primaryColor: Colors.green,
              ),
              CustomRadialProgress(
                percent: percent * 1.6,
                primaryColor: Colors.purple,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percent += 10;
            if (percent > 100) {
              percent = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color primaryColor;
  const CustomRadialProgress({
    super.key,
    required this.percent,
    this.primaryColor = Colors.blue,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: RadialProgress(
        percent: percent,
        primaryColor: primaryColor,
        secondaryColor: Colors.black12,
        // strockWidthPrimary: 3,
        // strockWidthSecondary: 2,
      ),
    );
  }
}
