import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RadialProgress renders correctly with default values', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: RadialProgress(percent: 50.0))),
    );

    // Verify that RadialProgress is rendered.
    expect(find.byType(RadialProgress), findsOneWidget);

    // Verify default colors and stroke widths are used (indirectly, by checking the widget properties)
    final radialProgressWidget = tester.widget<RadialProgress>(
      find.byType(RadialProgress),
    );
    expect(radialProgressWidget.percent, 50.0);
    expect(radialProgressWidget.primaryColor, Colors.blue);
    expect(radialProgressWidget.secondaryColor, Colors.grey);
    expect(radialProgressWidget.strockWidthPrimary, 10);
    expect(radialProgressWidget.strockWidthSecondary, 4);
  });

  testWidgets('RadialProgress renders correctly with custom values', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RadialProgress(
            percent: 75.0,
            primaryColor: Colors.red,
            secondaryColor: Colors.green,
            strockWidthPrimary: 15,
            strockWidthSecondary: 5,
          ),
        ),
      ),
    );

    // Verify that RadialProgress is rendered.
    expect(find.byType(RadialProgress), findsOneWidget);

    // Verify custom values are used
    final radialProgressWidget = tester.widget<RadialProgress>(
      find.byType(RadialProgress),
    );
    expect(radialProgressWidget.percent, 75.0);
    expect(radialProgressWidget.primaryColor, Colors.red);
    expect(radialProgressWidget.secondaryColor, Colors.green);
    expect(radialProgressWidget.strockWidthPrimary, 15);
    expect(radialProgressWidget.strockWidthSecondary, 5);
  });

  testWidgets('RadialProgress animates when percent changes', (
    WidgetTester tester,
  ) async {
    double initialPercent = 25.0;
    double finalPercent = 75.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: RadialProgress(percent: initialPercent)),
      ),
    );

    // Initial state
    expect(find.byType(RadialProgress), findsOneWidget);
    var radialProgressWidget = tester.widget<RadialProgress>(
      find.byType(RadialProgress),
    );
    expect(radialProgressWidget.percent, initialPercent);

    // Trigger a rebuild with a new percentage
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: RadialProgress(percent: finalPercent))),
    );

    // Pump frames to allow animation to progress
    // The animation duration is 300ms
    await tester.pump(const Duration(milliseconds: 150)); // Halfway through

    // Verify the widget is still there
    expect(find.byType(RadialProgress), findsOneWidget);

    // Pump the remaining duration
    await tester.pump(const Duration(milliseconds: 150));

    // Verify the final state
    radialProgressWidget = tester.widget<RadialProgress>(
      find.byType(RadialProgress),
    );
    expect(radialProgressWidget.percent, finalPercent);

    // You might need more sophisticated checks here depending on how
    // the animation visually manifests, possibly using golden file testing
    // or checking the painter's state if possible.
  });
}
