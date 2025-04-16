// integration_test/circle_graphic_page_integration_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// import 'package:disenos_app/main.dart' as app; // Importa tu main.dart
import 'package:disenos_app/src/pages/circle_graphic_page.dart'; // Importa la página
import 'package:disenos_app/src/widgets/radial_progress.dart'; // Importa el widget usado

void main() {
  // Asegura que el binding de IntegrationTest esté inicializado
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CircleGraphicPage Integration Tests', () {
    testWidgets('Tap refresh button increases percentage', (
      WidgetTester tester,
    ) async {
      // Inicia la aplicación. Puedes iniciar directamente en la página
      // si modificas tu main.dart temporalmente o usas rutas nombradas.
      // Aquí asumimos que la app inicia y navegamos o que es la página inicial.
      // Para este ejemplo, cargaremos directamente la página.
      await tester.pumpWidget(
        const MaterialApp(
          home: CircleGraphicPage(), // Carga directamente la página
        ),
      );

      // Espera a que la UI se estabilice
      await tester.pumpAndSettle();

      // Verifica el estado inicial (todos los progress en 0%)
      // Encontrar todos los widgets RadialProgress
      final radialProgressFinders = find.byType(RadialProgress);
      expect(radialProgressFinders, findsNWidgets(4)); // Esperamos 4 instancias

      // Verifica que el porcentaje inicial es 0 para el primer widget encontrado
      // (Podrías ser más específico si tuvieran keys únicas)
      RadialProgress initialProgress = tester.widget(
        radialProgressFinders.first,
      );
      expect(initialProgress.percent, 0.0);

      // Encuentra el FloatingActionButton por su icono
      final fabFinder = find.widgetWithIcon(
        FloatingActionButton,
        Icons.refresh,
      );
      expect(fabFinder, findsOneWidget);

      // Simula tocar el botón una vez
      await tester.tap(fabFinder);
      await tester
          .pumpAndSettle(); // Espera a que la UI se actualice y las animaciones terminen

      // Verifica que el porcentaje ha aumentado a 10 para el primer widget
      RadialProgress progressAfterTap1 = tester.widget(
        radialProgressFinders.first,
      );
      expect(progressAfterTap1.percent, 10.0);

      // Simula tocar el botón 10 veces más para completar el ciclo
      for (int i = 0; i < 10; i++) {
        await tester.tap(fabFinder);
        await tester.pumpAndSettle();
      }

      // Verifica que el porcentaje ha vuelto a 0 después de superar 100
      RadialProgress progressAfterCycle = tester.widget(
        radialProgressFinders.first,
      );
      expect(progressAfterCycle.percent, 0.0);
    });
  });
}
