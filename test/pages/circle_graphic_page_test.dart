// test/pages/circle_graphic_page_test.dart
import 'package:disenos_app/src/pages/circle_graphic_page.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart'; // Importante para encontrar el widget interno
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CircleGraphicPage Widget Tests', () {
    testWidgets('Initial state renders correctly', (WidgetTester tester) async {
      // Construye el widget
      await tester.pumpWidget(const MaterialApp(home: CircleGraphicPage()));

      // Verifica que la página principal se renderiza
      expect(find.byType(CircleGraphicPage), findsOneWidget);

      // Verifica que hay 4 widgets CustomRadialProgress
      expect(find.byType(CustomRadialProgress), findsNWidgets(4));

      // Verifica que el FloatingActionButton con el icono refresh existe
      expect(
        find.widgetWithIcon(FloatingActionButton, Icons.refresh),
        findsOneWidget,
      );

      // Verifica que el porcentaje inicial en los widgets es 0.0
      // Tomamos el primero como muestra, asumiendo que todos empiezan igual
      final firstProgressWidget = tester.widget<CustomRadialProgress>(
        find.byType(CustomRadialProgress).first,
      );
      expect(firstProgressWidget.percent, 0.0);

      // También podemos verificar el RadialProgress interno si es necesario
      final firstInternalProgress = tester.widget<RadialProgress>(
        find.byType(RadialProgress).first,
      );
      expect(firstInternalProgress.percent, 0.0);
      expect(
        firstInternalProgress.primaryColor,
        Colors.blue,
      ); // Color por defecto del primero

      // Verifica el color del segundo CustomRadialProgress
      final secondProgressWidget = tester.widget<CustomRadialProgress>(
        find.byType(CustomRadialProgress).at(1),
      );
      expect(secondProgressWidget.primaryColor, Colors.red);
      final secondInternalProgress = tester.widget<RadialProgress>(
        find.byType(RadialProgress).at(1),
      );
      expect(secondInternalProgress.primaryColor, Colors.red);
    });

    testWidgets('Tapping FAB increases percentage by 10', (
      WidgetTester tester,
    ) async {
      // Construye el widget
      await tester.pumpWidget(const MaterialApp(home: CircleGraphicPage()));

      // Encuentra el FAB
      final fabFinder = find.widgetWithIcon(
        FloatingActionButton,
        Icons.refresh,
      );
      expect(fabFinder, findsOneWidget);

      // Toca el FAB una vez
      await tester.tap(fabFinder);
      await tester.pump(); // Reconstruye el widget después del setState

      // Verifica que el porcentaje ahora es 10.0
      CustomRadialProgress progressWidget = tester.widget<CustomRadialProgress>(
        find.byType(CustomRadialProgress).first,
      );
      expect(progressWidget.percent, 10.0);

      // Toca el FAB otra vez
      await tester.tap(fabFinder);
      await tester.pump(); // Reconstruye

      // Verifica que el porcentaje ahora es 20.0
      progressWidget = tester.widget<CustomRadialProgress>(
        find.byType(CustomRadialProgress).first,
      );
      expect(progressWidget.percent, 20.0);
    });

    testWidgets('Percentage resets to 0 after exceeding 100', (
      WidgetTester tester,
    ) async {
      // Construye el widget
      await tester.pumpWidget(const MaterialApp(home: CircleGraphicPage()));

      // Encuentra el FAB
      final fabFinder = find.widgetWithIcon(
        FloatingActionButton,
        Icons.refresh,
      );

      // Toca el FAB 11 veces para pasar de 100
      for (int i = 0; i < 11; i++) {
        await tester.tap(fabFinder);
        await tester.pump(); // Reconstruye después de cada toque
      }

      // Verifica que el porcentaje se ha reseteado a 0.0
      final progressWidget = tester.widget<CustomRadialProgress>(
        find.byType(CustomRadialProgress).first,
      );
      expect(progressWidget.percent, 0.0);
    });
  });
}
