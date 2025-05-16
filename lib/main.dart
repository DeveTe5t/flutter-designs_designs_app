import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '/src/pages/animations_page.dart';
// import '/src/challenges/animated_square_page.dart';
// import 'src/labs/circular_progress_page.dart';
// import '/src/widgets/headers.dart';
// import '/src/pages/circle_graphic_page.dart';
// import 'src/labs/slide_show_page.dart';
// import 'src/pages/slide_show_page.dart';
// import '/src/pages/pinterest_page.dart';
// import '/src/pages/emergency_page.dart';
// import 'src/pages/sliver_list_page.dart';
// import '/src/theme/theme_changer.dart';
import '/src/pages/launcher_page.dart';
import 'src/theme/theme_changer.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (_) => ThemeChanger(2),
    //   child: const MyApp(),
    // ),
    const MyApp(),
  );
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
    themeChanger = ThemeChanger(2);
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
      // Se utiliza un Builder para obtener un BuildContext que está *debajo*
      // de ThemeChanger2Notifier en el árbol de widgets. Esto permite
      // que MaterialApp use ThemeChanger2Notifier.watch() para escuchar
      // los cambios de tema y reconstruirse cuando el tema cambie.
      child: Builder(
        builder: (BuildContext context) {
          // Se accede al ThemeChanger2 a través del método watch del Notifier.
          // Esto establece una dependencia, por lo que si el tema cambia en
          // ThemeChanger2 y notifica a sus oyentes, este Builder se reconstruirá,
          // actualizando el tema del MaterialApp.
          final currentThemeFromNotifier =
              ThemeChangerNotifier.watch(context).currentTheme;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Designs app',
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff615AAB)),
            // ),
            // theme: currentTheme,
            // Se usa el tema obtenido del Notifier, que ahora es reactivo.
            theme: currentThemeFromNotifier,
            // home: const CircleGraphicPage(),
            // home: const SlideShowPage(),
            // home: const PinterestPage(),
            // home: const EmergencyPage(),
            // home: const SliverListPage(),
            home: const LauncherPage(),
          );
        },
      ),
    );
  }
}
