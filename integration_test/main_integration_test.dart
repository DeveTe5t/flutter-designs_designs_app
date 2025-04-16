// integration_test/app_launch_test.dart
import 'package:disenos_app/src/pages/circle_graphic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:disenos_app/main.dart' as app; // Importa tu main.dart como app

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Launch Test', () {
    testWidgets('App launches and shows initial page (CircleGraphicPage)', (
      WidgetTester tester,
    ) async {
      // Ejecuta la función main de tu aplicación
      app.main();

      // Espera a que la aplicación se renderice completamente y se estabilice
      await tester.pumpAndSettle();

      // Verifica que la página inicial (CircleGraphicPage) se muestra
      expect(find.byType(CircleGraphicPage), findsOneWidget);

      // Verifica que elementos clave de CircleGraphicPage están presentes
      expect(
        find.widgetWithIcon(FloatingActionButton, Icons.refresh),
        findsOneWidget,
      );
      expect(
        find.byType(CustomRadialProgress),
        findsNWidgets(4),
      ); // Verifica los 4 gráficos

      // Puedes agregar más verificaciones si es necesario, por ejemplo,
      // verificar el estado inicial de los gráficos si es relevante para el arranque.
      final firstProgressWidget = tester.widget<CustomRadialProgress>(
        find.byType(CustomRadialProgress).first,
      );
      expect(firstProgressWidget.percent, 0.0);
    });
  });
}
