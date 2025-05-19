import 'package:flutter/material.dart';

import '/src/pages/launcher_page.dart';
import 'src/theme/theme_changer.dart';

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

  @override
  void initState() {
    super.initState();
    themeChanger = ThemeChanger(AppThemeType.dark);
  }

  @override
  void dispose() {
    themeChanger.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      child: const AppWithTheme(),
    );
  }
}

// for Way 2: clearer
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
      home: const LauncherPage(),
    );
  }
}
