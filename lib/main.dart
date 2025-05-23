import 'package:flutter/material.dart';

// import '/src/pages/launcher_page.dart';
import '/src/pages/pages.dart';
import '/src/theme/theme_changer.dart';
import '/src/models/layout_model.dart';

// ####### 1 With stateful
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeChanger themeChanger;
  late LayoutModel layoutModel;

  @override
  void initState() {
    super.initState();
    themeChanger = ThemeChanger(AppThemeType.dark);
    layoutModel = LayoutModel();
  }

  @override
  void dispose() {
    themeChanger.dispose();
    layoutModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return ThemeChangerNotifier(
    //   model: themeChanger,
    //   // // ------- Way 1
    //   // // Se utiliza un Builder para obtener un BuildContext que está *debajo*
    //   // // de ThemeChanger2Notifier en el árbol de widgets. Esto permite
    //   // // que MaterialApp use ThemeChanger2Notifier.watch() para escuchar
    //   // // los cambios de tema y reconstruirse cuando el tema cambie.
    //   // child: Builder(
    //   //   builder: (BuildContext context) {
    //   //     final currentThemeFromNotifier =
    //   //         ThemeChangerNotifier.watch(context).currentTheme;

    //   //     return MaterialApp(
    //   //       debugShowCheckedModeBanner: false,
    //   //       title: 'Designs app',
    //   //       // Se usa el tema obtenido del Notifier, que ahora es reactivo.
    //   //       theme: currentThemeFromNotifier,
    //   //       home: const LauncherPage(),
    //   //     );
    //   //   },
    //   // ),

    //   // ------- Way 2
    //   // Se reemplaza el Builder con un widget dedicado
    //   child: LayoutModelNotifier(
    //     model: layoutModel,
    //     child: const AppWithTheme(),
    //   ),
    // );

    return AppProviders(
      themeChanger: themeChanger,
      layoutModel: layoutModel,
      child: const AppWithTheme(),
    );
  }
}

class AppProviders extends StatelessWidget {
  final ThemeChanger themeChanger;
  final LayoutModel layoutModel;
  final Widget child;

  const AppProviders({
    super.key,
    required this.themeChanger,
    required this.layoutModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // return ThemeChangerNotifier(
    //   model: themeChanger,
    //   child: LayoutModelNotifier(
    //     model: layoutModel,
    //     child: child,
    //   ),
    // );
    return ThemeChangerNotifier(
      model: themeChanger,
      // // ------- Way 1
      // // Se utiliza un Builder para obtener un BuildContext que está *debajo*
      // // de ThemeChanger2Notifier en el árbol de widgets. Esto permite
      // // que MaterialApp use ThemeChanger2Notifier.watch() para escuchar
      // // los cambios de tema y reconstruirse cuando el tema cambie.
      // child: Builder(
      //   builder: (BuildContext context) {
      //     final currentThemeFromNotifier =
      //         ThemeChangerNotifier.watch(context).currentTheme;

      //     return MaterialApp(
      //       debugShowCheckedModeBanner: false,
      //       title: 'Designs app',
      //       // Se usa el tema obtenido del Notifier, que ahora es reactivo.
      //       theme: currentThemeFromNotifier,
      //       home: const LauncherPage(),
      //     );
      //   },
      // ),

      // ------- Way 2
      // Se reemplaza el Builder con un widget dedicado
      child: LayoutModelNotifier(
        model: layoutModel,
        child: const AppWithTheme(),
      ),
    );
  }
}

// Nuevo StatelessWidget para construir el MaterialApp con el tema reactivo
class AppWithTheme extends StatelessWidget {
  const AppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    // Se accede al ThemeChanger a través del método watch del Notifier.
    // Esto establece una dependencia, por lo que si el tema cambia en
    // ThemeChanger y notifica a sus oyentes, este widget se reconstruirá,
    // actualizando el tema del MaterialApp.
    final currentThemeFromNotifier =
        ThemeChangerNotifier.watch(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs app',
      // Se usa el tema obtenido del Notifier, que ahora es reactivo.
      theme: currentThemeFromNotifier,
      // Before
      // home: const LauncherPage(),
      // After
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientation: $orientation');
          // final screenSize = MediaQuery.of(context).size;
          final screenSize = MediaQuery.sizeOf(context).width;

          if (screenSize > 500) {
            return const LauncherTabletPage();
          }

          return const LauncherPage();
        },
      ),
    );
  }
}

// ####### 2 Without stateful
// void main() {
//   // 1. Crear la instancia de ThemeChanger aquí.
//   final themeChanger = ThemeChanger(AppThemeType.dark);
//   // NOTA: Si ThemeChanger necesita liberar recursos (llamar a dispose),
//   // este enfoque simple no lo maneja automáticamente al cerrar la app.
//   // Para una gestión de ciclo de vida más robusta, considera usar un paquete
//   // como 'provider' con ChangeNotifierProvider, que sí maneja el dispose.
//   runApp(MyApp(themeChanger: themeChanger));
// }

// // 2. MyApp ahora es un StatelessWidget.
// class MyApp extends StatelessWidget {
//   final ThemeChanger themeChanger;

//   const MyApp({super.key, required this.themeChanger});

//   @override
//   Widget build(BuildContext context) {
//     // 3. Pasa la instancia de themeChanger a ThemeChangerNotifier.
//     return ThemeChangerNotifier(
//       model: themeChanger,
//       child: const AppWithTheme(),
//     );
//   }
// }

// // AppWithTheme permanece igual, ya que su lógica para escuchar cambios
// // a través de ThemeChangerNotifier.watch(context) es independiente
// // de si MyApp es StatefulWidget o StatelessWidget.
// class AppWithTheme extends StatelessWidget {
//   const AppWithTheme({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final currentThemeFromNotifier =
//         ThemeChangerNotifier.watch(context).currentTheme;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Designs app',
//       theme: currentThemeFromNotifier,
//       home: const LauncherPage(),
//     );
//   }
// }
