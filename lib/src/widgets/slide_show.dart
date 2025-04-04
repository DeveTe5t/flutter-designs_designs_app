// way 1: work without changes dynamics from call ------------
// import 'dart:async';
// import 'package:flutter/material.dart';

// // --- Configuración y Modelo ---

// class AutoMoveConfig {
//   final bool loop;
//   final Duration duration;

//   const AutoMoveConfig({
//     this.loop = false,
//     this.duration = const Duration(seconds: 2),
//   });
// }

// // _SliderModel ahora es un ChangeNotifier estándar
// class _SliderModel with ChangeNotifier {
//   double _currentPage = 0;
//   bool _dotsUp = false;
//   Color _dotPrimaryColor = Colors.blue;
//   Color _dotSecondaryColor = Colors.grey;
//   double _dotPrimarySize = 12;
//   double _dotSecondarySize = 12;
//   bool _autoMove = false;
//   Duration _autoMoveDuration = const Duration(seconds: 2);

//   double get currentPage => _currentPage;
//   set currentPage(double value) {
//     // Evita notificaciones innecesarias si el valor no cambia
//     if (_currentPage == value) return;
//     _currentPage = value;
//     notifyListeners(); // Notifica a los oyentes (como AnimatedBuilder)
//   }

//   // Getters para las otras propiedades (no necesitan setters con notifyListeners
//   // si solo se establecen una vez al inicio)
//   bool get dotsUp => _dotsUp;
//   Color get dotPrimaryColor => _dotPrimaryColor;
//   Color get dotSecondaryColor => _dotSecondaryColor;
//   double get dotPrimarySize => _dotPrimarySize;
//   double get dotSecondarySize => _dotSecondarySize;
//   bool get autoMove => _autoMove;
//   Duration get autoMoveDuration => _autoMoveDuration;

//   // Método para inicializar/actualizar las propiedades de configuración
//   void updateConfig({
//     required bool dotsUp,
//     required Color dotPrimaryColor,
//     required Color dotSecondaryColor,
//     required double dotPrimarySize,
//     required double dotSecondarySize,
//     required bool autoMove,
//     required Duration autoMoveDuration,
//   }) {
//     _dotsUp = dotsUp;
//     _dotPrimaryColor = dotPrimaryColor;
//     _dotSecondaryColor = dotSecondaryColor;
//     _dotPrimarySize = dotPrimarySize;
//     _dotSecondarySize = dotSecondarySize;
//     _autoMove = autoMove;
//     _autoMoveDuration = autoMoveDuration;
//     // No se necesita notifyListeners() aquí si estos valores
//     // solo se leen una vez o no cambian después de la inicialización.
//     // Si pudieran cambiar dinámicamente y afectar la UI,
//     // se debería llamar a notifyListeners() o gestionar su actualización
//     // de forma más específica.
//   }
// }

// // --- Widget Principal (Ahora StatefulWidget) ---

// class SlideShow extends StatefulWidget {
//   final List<Widget> slides;
//   final bool dotsUp;
//   final Color dotPrimaryColor;
//   final Color dotSecondaryColor;
//   final double dotPrimarySize;
//   final double dotSecondarySize;
//   final AutoMoveConfig autoMoveConfig;

//   const SlideShow({
//     super.key,
//     required this.slides,
//     this.dotsUp = false,
//     this.dotPrimaryColor = Colors.blue,
//     this.dotSecondaryColor = Colors.grey,
//     this.dotPrimarySize = 12,
//     this.dotSecondarySize = 12,
//     this.autoMoveConfig = const AutoMoveConfig(),
//   });

//   @override
//   State<SlideShow> createState() => _SlideShowState();
// }

// class _SlideShowState extends State<SlideShow> {
//   // Se crea y gestiona la instancia del _SliderModel aquí
//   late final _SliderModel _sliderModel;
//   // PageController se gestiona aquí para pasarlo a _Slides
//   late final PageController _pageViewController;

//   @override
//   void initState() {
//     super.initState();
//     _sliderModel = _SliderModel(); // Crear la instancia
//     _pageViewController = PageController(); // Crear el PageController

//     // Inicializar el modelo con los parámetros del widget
//     _sliderModel.updateConfig(
//       dotsUp: widget.dotsUp,
//       dotPrimaryColor: widget.dotPrimaryColor,
//       dotSecondaryColor: widget.dotSecondaryColor,
//       dotPrimarySize: widget.dotPrimarySize,
//       dotSecondarySize: widget.dotSecondarySize,
//       autoMove: widget.autoMoveConfig.loop,
//       autoMoveDuration: widget.autoMoveConfig.duration,
//     );

//     // Añadir el listener al PageController para actualizar el modelo
//     _pageViewController.addListener(() {
//       // Se accede directamente al modelo gestionado por este State
//       _sliderModel.currentPage = _pageViewController.page ?? 0;
//     });
//   }

//   @override
//   void dispose() {
//     _pageViewController.dispose(); // Dispose del PageController
//     _sliderModel.dispose(); // Dispose del ChangeNotifier
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Ya no se necesita ChangeNotifierProvider ni Builder
//     return SafeArea(
//       child: Center(
//         // Se pasa el modelo y el controller a los hijos que lo necesiten
//         child: _CreateSlideShowStructure(
//           slides: widget.slides,
//           sliderModel: _sliderModel, // Pasar la instancia del modelo
//           pageViewController: _pageViewController, // Pasar el controller
//         ),
//       ),
//     );
//   }
// }

// // --- Widgets Internos (Modificados para recibir el modelo) ---

// class _CreateSlideShowStructure extends StatelessWidget {
//   final List<Widget> slides;
//   final _SliderModel sliderModel; // Recibe el modelo
//   final PageController pageViewController; // Recibe el controller

//   const _CreateSlideShowStructure({
//     required this.slides,
//     required this.sliderModel,
//     required this.pageViewController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Accede a 'dotsUp' directamente desde el modelo recibido
//     final slideDotsUp = sliderModel.dotsUp;

//     return Column(
//       children: [
//         // Pasa el modelo a _Dots si está arriba
//         if (slideDotsUp)
//           _Dots(totalDots: slides.length, sliderModel: sliderModel),

//         // Pasa los slides, el modelo y el controller a _Slides
//         Expanded(
//           child: _Slides(
//             slides: slides,
//             sliderModel: sliderModel,
//             pageViewController: pageViewController, // Pasa el controller aquí
//           ),
//         ),

//         // Pasa el modelo a _Dots si está abajo
//         if (!slideDotsUp)
//           _Dots(totalDots: slides.length, sliderModel: sliderModel),
//       ],
//     );
//   }
// }

// class _Dots extends StatelessWidget {
//   final int totalDots;
//   final _SliderModel sliderModel; // Recibe el modelo

//   const _Dots({required this.totalDots, required this.sliderModel});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 70.0,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               // Pasa el modelo a cada _Dot
//               children: List.generate(
//                 totalDots,
//                 (i) => _Dot(index: i, sliderModel: sliderModel),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   final int index;
//   final _SliderModel sliderModel; // Recibe el modelo

//   const _Dot({required this.index, required this.sliderModel});

//   @override
//   Widget build(BuildContext context) {
//     // Usamos AnimatedBuilder para escuchar cambios SOLO en _sliderModel
//     // y reconstruir SOLO este widget (_Dot) cuando sea necesario (cambie currentPage)
//     return AnimatedBuilder(
//       animation: sliderModel, // Escucha al _SliderModel
//       builder: (context, child) {
//         // La lógica para determinar tamaño y color se mueve aquí dentro
//         final double size;
//         final Color color;

//         if (sliderModel.currentPage >= index - 0.5 &&
//             sliderModel.currentPage < index + 0.5) {
//           size = sliderModel.dotPrimarySize;
//           color = sliderModel.dotPrimaryColor;
//         } else {
//           size = sliderModel.dotSecondarySize;
//           color = sliderModel.dotSecondaryColor;
//         }

//         // Devuelve el AnimatedContainer, que se reconstruirá eficientemente
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           width: size,
//           height: size,
//           margin: const EdgeInsets.symmetric(horizontal: 5),
//           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//         );
//       },
//     );
//   }
// }

// class _Slides extends StatefulWidget {
//   final List<Widget> slides;
//   final _SliderModel sliderModel; // Recibe el modelo
//   final PageController pageViewController; // Recibe el controller

//   const _Slides({
//     required this.slides,
//     required this.sliderModel,
//     required this.pageViewController,
//   });

//   @override
//   State<_Slides> createState() => _SlidesState();
// }

// class _SlidesState extends State<_Slides> {
//   Timer? _intervalSlider; // Hacerlo nullable

//   @override
//   void initState() {
//     super.initState();

//     // Acceder a la configuración directamente desde el modelo pasado por el widget
//     final bool autoMove = widget.sliderModel.autoMove;
//     final Duration autoMoveDuration = widget.sliderModel.autoMoveDuration;

//     // El listener del PageController ya se configura en _SlideShowState

//     if (!autoMove) return;

//     _intervalSlider = Timer.periodic(autoMoveDuration, (timer) {
//       // Usa el pageViewController directamente desde el widget
//       final pageController = widget.pageViewController;
//       // Calcula la página actual basándose en el controller si existe
//       int currentPage = pageController.page?.round() ?? 0;

//       if (currentPage < widget.slides.length - 1) {
//         currentPage++;
//       } else {
//         currentPage = 0; // Volver al inicio
//       }

//       // Animar usando el controller recibido
//       pageController.animateToPage(
//         currentPage,
//         // duration: (autoMoveDuration * 0.5), // Considera ajustar esta duración
//         duration: const Duration(milliseconds: 1000),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _intervalSlider?.cancel(); // Cancela el timer si existe
//     // El PageController se dispone en _SlideShowState, no aquí
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Usa el pageViewController recibido del widget padre
//     return PageView(
//       controller: widget.pageViewController,
//       children: widget.slides.map((slide) => _Slide(slide)).toList(),
//     );
//   }
// }

// // _Slide no necesita cambios, es un widget de presentación simple
// class _Slide extends StatelessWidget {
//   final Widget slide;
//   const _Slide(this.slide);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       padding: const EdgeInsets.all(30),
//       child: slide,
//     );
//   }
// }

// way 2: work with changes dynamics from call ------------
// import 'dart:async';
// import 'package:flutter/material.dart';

// // --- Configuración y Modelo ---
// class AutoMoveConfig {
//   final bool loop;
//   final Duration duration;

//   const AutoMoveConfig({
//     this.loop = false,
//     this.duration = const Duration(seconds: 2),
//   });
// }

// // _SliderModel ahora es un ChangeNotifier estándar
// class _SliderModel with ChangeNotifier {
//   double _currentPage = 0;
//   bool _dotsUp = false;
//   Color _dotPrimaryColor = Colors.blue;
//   Color _dotSecondaryColor = Colors.grey;
//   double _dotPrimarySize = 12;
//   double _dotSecondarySize = 12;
//   bool _autoMove = false;
//   Duration _autoMoveDuration = const Duration(seconds: 2);

//   // Necesitarás una forma de actualizar autoMove y su duración también
//   void updateAutoMove(AutoMoveConfig config) {
//     bool configChanged =
//         _autoMove != config.loop || _autoMoveDuration != config.duration;
//     if (!configChanged) return;
//     _autoMove = config.loop;
//     _autoMoveDuration = config.duration;
//     // No necesariamente notificar aquí, la lógica del Timer reaccionará
//     // Pero si alguna UI depende DIRECTAMENTE de _autoMove, notifica.
//     // notifyListeners();
//   }

//   // Método inicial para configurar todo sin notificar (usado en initState)
//   void initializeConfig({
//     required bool dotsUp,
//     required Color dotPrimaryColor,
//     required Color dotSecondaryColor,
//     required double dotPrimarySize,
//     required double dotSecondarySize,
//     required AutoMoveConfig autoMoveConfig,
//   }) {
//     _dotsUp = dotsUp;
//     _dotPrimaryColor = dotPrimaryColor;
//     _dotSecondaryColor = dotSecondaryColor;
//     _dotPrimarySize = dotPrimarySize;
//     _dotSecondarySize = dotSecondarySize;
//     _autoMove = autoMoveConfig.loop;
//     _autoMoveDuration = autoMoveConfig.duration;
//     // No notifyListeners() aquí
//   }

//   double get currentPage => _currentPage;
//   set currentPage(double value) {
//     // Evita notificaciones innecesarias si el valor no cambia
//     if (_currentPage == value) return;
//     _currentPage = value;
//     notifyListeners(); // Notifica a los oyentes (como AnimatedBuilder)
//   }

//   set dotsUp(bool value) {
//     if (_dotsUp == value) return;
//     _dotsUp = value;
//     notifyListeners();
//   }

//   set dotPrimaryColor(Color value) {
//     if (_dotPrimaryColor == value) return;
//     _dotPrimaryColor = value;
//     notifyListeners();
//   }

//   set dotSecondaryColor(Color value) {
//     if (_dotSecondaryColor == value) return;
//     _dotSecondaryColor = value;
//     notifyListeners();
//   }

//   set dotPrimarySize(double value) {
//     if (_dotPrimarySize == value) return;
//     _dotPrimarySize = value;
//     notifyListeners();
//   }

//   set dotSecondarySize(double value) {
//     if (_dotSecondarySize == value) return;
//     _dotSecondarySize = value;
//     notifyListeners();
//   }
//   // Getters para las otras propiedades (no necesitan setters con notifyListeners
//   // si solo se establecen una vez al inicio)

//   bool get dotsUp => _dotsUp;
//   Color get dotPrimaryColor => _dotPrimaryColor;
//   Color get dotSecondaryColor => _dotSecondaryColor;
//   double get dotPrimarySize => _dotPrimarySize;
//   double get dotSecondarySize => _dotSecondarySize;
//   bool get autoMove => _autoMove;
//   Duration get autoMoveDuration => _autoMoveDuration;
// }

// class SlideShow extends StatefulWidget {
//   final List<Widget> slides;
//   final bool dotsUp;
//   final Color dotPrimaryColor;
//   final Color dotSecondaryColor;
//   final double dotPrimarySize;
//   final double dotSecondarySize;
//   final AutoMoveConfig autoMoveConfig;

//   const SlideShow({
//     super.key,
//     required this.slides,
//     this.dotsUp = false,
//     this.dotPrimaryColor = Colors.blue,
//     this.dotSecondaryColor = Colors.grey,
//     this.dotPrimarySize = 12,
//     this.dotSecondarySize = 12,
//     this.autoMoveConfig = const AutoMoveConfig(),
//   });

//   @override
//   State<SlideShow> createState() => _SlideShowState();
// }

// // --- _SlideShowState ---
// class _SlideShowState extends State<SlideShow> {
//   late final _SliderModel _sliderModel;
//   late final PageController _pageViewController;
//   Timer? _autoMoveTimer; // Mover el Timer aquí

//   @override
//   void initState() {
//     super.initState();
//     _sliderModel = _SliderModel();
//     _pageViewController = PageController();

//     // Inicializa el modelo
//     _sliderModel.initializeConfig(
//       dotsUp: widget.dotsUp,
//       dotPrimaryColor: widget.dotPrimaryColor,
//       dotSecondaryColor: widget.dotSecondaryColor,
//       dotPrimarySize: widget.dotPrimarySize,
//       dotSecondarySize: widget.dotSecondarySize,
//       autoMoveConfig: widget.autoMoveConfig,
//     );

//     _pageViewController.addListener(() {
//       _sliderModel.currentPage = _pageViewController.page ?? 0;
//     });

//     // Iniciar el Timer inicial si es necesario
//     _setupAutoMoveTimer();
//   }

//   @override
//   void didUpdateWidget(covariant SlideShow oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     // Compara y actualiza las propiedades del modelo si han cambiado
//     if (widget.dotsUp != oldWidget.dotsUp) {
//       _sliderModel.dotsUp = widget.dotsUp; // Usa el setter que notifica
//     }
//     if (widget.dotPrimaryColor != oldWidget.dotPrimaryColor) {
//       // Asumiendo setters similares para los demás...
//       _sliderModel.dotPrimaryColor = widget.dotPrimaryColor;
//     }
//     if (widget.dotSecondaryColor != oldWidget.dotSecondaryColor) {
//       _sliderModel.dotSecondaryColor = widget.dotSecondaryColor;
//     }
//     if (widget.dotPrimarySize != oldWidget.dotPrimarySize) {
//       _sliderModel.dotPrimarySize = widget.dotPrimarySize;
//     }
//     if (widget.dotSecondarySize != oldWidget.dotSecondarySize) {
//       _sliderModel.dotSecondarySize = widget.dotSecondarySize;
//     }

//     // Compara y actualiza la configuración de autoMove y reinicia el Timer
//     if (widget.autoMoveConfig != oldWidget.autoMoveConfig) {
//       _sliderModel.updateAutoMove(widget.autoMoveConfig);
//       _setupAutoMoveTimer(); // Reinicia el timer con la nueva config
//     }
//   }

//   void _setupAutoMoveTimer() {
//     _autoMoveTimer?.cancel(); // Cancela el timer anterior si existe
//     _autoMoveTimer = null;

//     if (_sliderModel.autoMove && widget.slides.isNotEmpty) {
//       _autoMoveTimer = Timer.periodic(_sliderModel.autoMoveDuration, (timer) {
//         // La lógica del PageView sigue igual, pero usa _pageViewController
//         int currentPage = _pageViewController.page?.round() ?? 0;
//         int nextPage = 0;

//         if (currentPage < widget.slides.length - 1) {
//           nextPage = currentPage + 1;
//         } // else nextPage sigue siendo 0 (loop)

//         _pageViewController.animateToPage(
//           nextPage,
//           duration: const Duration(
//             milliseconds: 1000,
//           ), // O ajusta según necesites
//           curve: Curves.easeInOut,
//         );
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _autoMoveTimer?.cancel();
//     _pageViewController.dispose();
//     _sliderModel.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // El build sigue igual, pasa el modelo y el controller
//     return SafeArea(
//       child: Center(
//         child: _CreateSlideShowStructure(
//           slides: widget.slides,
//           sliderModel: _sliderModel,
//           pageViewController: _pageViewController,
//         ),
//       ),
//     );
//   }
// }

// class _CreateSlideShowStructure extends StatelessWidget {
//   final List<Widget> slides;
//   final _SliderModel sliderModel; // Recibe el modelo
//   final PageController pageViewController; // Recibe el controller

//   const _CreateSlideShowStructure({
//     required this.slides,
//     required this.sliderModel,
//     required this.pageViewController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Accede a 'dotsUp' directamente desde el modelo recibido
//     final slideDotsUp = sliderModel.dotsUp;

//     return Column(
//       children: [
//         // Pasa el modelo a _Dots si está arriba
//         if (slideDotsUp)
//           _Dots(totalDots: slides.length, sliderModel: sliderModel),

//         // Pasa los slides, el modelo y el controller a _Slides
//         Expanded(
//           child: _Slides(
//             slides: slides,
//             // sliderModel: sliderModel,
//             pageViewController: pageViewController, // Pasa el controller aquí
//           ),
//         ),

//         // Pasa el modelo a _Dots si está abajo
//         if (!slideDotsUp)
//           _Dots(totalDots: slides.length, sliderModel: sliderModel),
//       ],
//     );
//   }
// }

// class _Dots extends StatelessWidget {
//   final int totalDots;
//   final _SliderModel sliderModel; // Recibe el modelo

//   const _Dots({required this.totalDots, required this.sliderModel});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 70.0,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               // Pasa el modelo a cada _Dot
//               children: List.generate(
//                 totalDots,
//                 (i) => _Dot(index: i, sliderModel: sliderModel),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   final int index;
//   final _SliderModel sliderModel; // Recibe el modelo

//   const _Dot({required this.index, required this.sliderModel});

//   @override
//   Widget build(BuildContext context) {
//     // Usamos AnimatedBuilder para escuchar cambios SOLO en _sliderModel
//     // y reconstruir SOLO este widget (_Dot) cuando sea necesario (cambie currentPage)
//     return AnimatedBuilder(
//       animation: sliderModel, // Escucha al _SliderModel
//       builder: (context, child) {
//         // La lógica para determinar tamaño y color se mueve aquí dentro
//         final double size;
//         final Color color;

//         if (sliderModel.currentPage >= index - 0.5 &&
//             sliderModel.currentPage < index + 0.5) {
//           size = sliderModel.dotPrimarySize;
//           color = sliderModel.dotPrimaryColor;
//         } else {
//           size = sliderModel.dotSecondarySize;
//           color = sliderModel.dotSecondaryColor;
//         }

//         // Devuelve el AnimatedContainer, que se reconstruirá eficientemente
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           width: size,
//           height: size,
//           margin: const EdgeInsets.symmetric(horizontal: 5),
//           decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//         );
//       },
//     );
//   }
// }

// // --- _Slides Widget ---
// // Ya NO necesita gestionar el Timer ni ser StatefulWidget si el Timer se maneja arriba
// class _Slides extends StatelessWidget {
//   // Puede ser StatelessWidget ahora
//   final List<Widget> slides;
//   // Ya no necesita el sliderModel si no lee nada más de él directamente
//   // final _SliderModel sliderModel;
//   final PageController pageViewController; // Sigue necesitando el controller

//   const _Slides({
//     required this.slides,
//     // required this.sliderModel,
//     required this.pageViewController,
//   });

//   // initState y dispose relacionados al Timer se eliminan

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: pageViewController, // Usa el controller pasado
//       children: slides.map((slide) => _Slide(slide)).toList(),
//     );
//   }
// }

// class _Slide extends StatelessWidget {
//   final Widget slide;
//   const _Slide(this.slide);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       padding: const EdgeInsets.all(30),
//       child: slide,
//     );
//   }
// }

// way 3: without package but with changes dynamics ------------
import 'dart:async';
import 'package:flutter/material.dart';

// --- Modelos de Datos y Estado ---

class AutoMoveConfig {
  final bool loop;
  final Duration duration;

  const AutoMoveConfig({
    this.loop = false,
    this.duration = const Duration(seconds: 2),
  });
}

// El modelo de estado sigue siendo un ChangeNotifier
class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  bool _dotsUp = false;
  Color _dotPrimaryColor = Colors.blue;
  Color _dotSecondaryColor = Colors.grey;
  double _dotPrimarySize = 12;
  double _dotSecondarySize = 12;
  bool _autoMove = false;
  Duration _autoMoveDuration = const Duration(seconds: 2);

  double get currentPage => _currentPage;
  set currentPage(double currentPage) {
    // Evita notificaciones si el valor no ha cambiado significativamente
    // (PageView puede disparar muchos eventos con cambios mínimos)
    if ((_currentPage - currentPage).abs() < 0.01) return;
    // if (_currentPage == currentPage) return;
    _currentPage = currentPage;
    notifyListeners();
  }

  bool get dotsUp => _dotsUp;
  set dotsUp(bool value) {
    if (_dotsUp == value) return;
    _dotsUp = value;
    // Podrías notificar si la posición de los puntos cambiara dinámicamente,
    // pero usualmente se configura una vez.
    // notifyListeners();
  }

  Color get dotPrimaryColor => _dotPrimaryColor;
  set dotPrimaryColor(Color value) {
    if (_dotPrimaryColor == value) return;
    _dotPrimaryColor = value;
    // notifyListeners(); // Opcional, si el color necesita actualizar la UI dinámicamente
  }

  Color get dotSecondaryColor => _dotSecondaryColor;
  set dotSecondaryColor(Color value) {
    if (_dotSecondaryColor == value) return;
    _dotSecondaryColor = value;
    // notifyListeners(); // Opcional
  }

  double get dotPrimarySize => _dotPrimarySize;
  set dotPrimarySize(double value) {
    if (_dotPrimarySize == value) return;
    _dotPrimarySize = value;
    // notifyListeners(); // Opcional
  }

  double get dotSecondarySize => _dotSecondarySize;
  set dotSecondarySize(double value) {
    if (_dotSecondarySize == value) return;
    _dotSecondarySize = value;
    // notifyListeners(); // Opcional
  }

  bool get autoMove => _autoMove;
  set autoMove(bool value) {
    if (_autoMove == value) return;
    _autoMove = value;
    notifyListeners();
    // Este cambio sí podría necesitar reiniciar el temporizador,
    // lo cual se maneja en el _SlidesState
  }

  Duration get autoMoveDuration => _autoMoveDuration;
  set autoMoveDuration(Duration value) {
    if (_autoMoveDuration == value) return;
    _autoMoveDuration = value;
    notifyListeners();
    // Este cambio sí podría necesitar reiniciar el temporizador,
    // lo cual se maneja en el _SlidesState
  }
}

// --- InheritedNotifier para proveer el modelo ---

class _SlideShowNotifier extends InheritedNotifier<_SliderModel> {
  const _SlideShowNotifier({required _SliderModel model, required super.child})
    : super(notifier: model);

  // Método para obtener el modelo y escuchar cambios (reconstruye el widget)
  static _SliderModel watch(BuildContext context) {
    final notifier =
        context
            .dependOnInheritedWidgetOfExactType<_SlideShowNotifier>()
            ?.notifier;
    assert(notifier != null, 'No _SlideShowNotifier found in context');
    return notifier!;
  }

  // Método para obtener el modelo sin escuchar cambios
  static _SliderModel read(BuildContext context) {
    final widget =
        context
            .getElementForInheritedWidgetOfExactType<_SlideShowNotifier>()
            ?.widget;
    assert(
      widget is _SlideShowNotifier,
      'No _SlideShowNotifier found in context',
    );
    return (widget as _SlideShowNotifier).notifier!;
  }
}

// --- Widgets de la UI ---

class SlideShow extends StatefulWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  final double dotPrimarySize;
  final double dotSecondarySize;
  final AutoMoveConfig autoMoveConfig;

  const SlideShow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.dotPrimaryColor = Colors.blue,
    this.dotSecondaryColor = Colors.grey,
    this.dotPrimarySize = 12,
    this.dotSecondarySize = 12,
    this.autoMoveConfig = const AutoMoveConfig(),
  });

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  // Mantenemos la instancia del modelo en el State
  late final _SliderModel _sliderModel;

  @override
  void initState() {
    super.initState();
    _sliderModel = _SliderModel();
    _updateModelProperties(); // Inicializar propiedades del modelo
  }

  // Método para transferir propiedades del Widget al Modelo
  void _updateModelProperties() {
    _sliderModel.dotsUp = widget.dotsUp;
    _sliderModel.dotPrimaryColor = widget.dotPrimaryColor;
    _sliderModel.dotSecondaryColor = widget.dotSecondaryColor;
    _sliderModel.dotPrimarySize = widget.dotPrimarySize;
    _sliderModel.dotSecondarySize = widget.dotSecondarySize;
    _sliderModel.autoMove = widget.autoMoveConfig.loop;
    _sliderModel.autoMoveDuration = widget.autoMoveConfig.duration;
  }

  @override
  void didUpdateWidget(covariant SlideShow oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Si las propiedades del widget cambian, actualizamos el modelo
    if (widget.dotsUp != oldWidget.dotsUp ||
        widget.dotPrimaryColor != oldWidget.dotPrimaryColor ||
        widget.dotSecondaryColor != oldWidget.dotSecondaryColor ||
        widget.dotPrimarySize != oldWidget.dotPrimarySize ||
        widget.dotSecondarySize != oldWidget.dotSecondarySize ||
        widget.autoMoveConfig.loop != oldWidget.autoMoveConfig.loop ||
        widget.autoMoveConfig.duration != oldWidget.autoMoveConfig.duration) {
      _updateModelProperties();
      // Nota: No es necesario llamar a notifyListeners aquí, ya que los widgets
      // hijos que usen 'watch' obtendrán los nuevos valores en su reconstrucción.
      // El cambio en autoMove/duration será recogido por _SlidesState.
    }
  }

  @override
  void dispose() {
    _sliderModel.dispose(); // ¡Importante!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usamos el InheritedNotifier para proveer el modelo al subárbol
    return _SlideShowNotifier(
      model: _sliderModel,
      child: SafeArea(
        child: Center(
          // Ya no necesitamos el Builder aquí
          child: _CreateSlideShowStructure(slides: widget.slides),
        ),
      ),
    );
  }
}

class _CreateSlideShowStructure extends StatelessWidget {
  const _CreateSlideShowStructure({required this.slides});

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    // Obtenemos el valor de dotsUp usando 'watch'
    final slideDotsUp = _SlideShowNotifier.watch(context).dotsUp;
    return Column(
      children: [
        if (slideDotsUp) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!slideDotsUp) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalDots;
  const _Dots(this.totalDots);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalDots, (i) => _Dot(i)),
            ),
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    // Usamos 'watch' porque la apariencia del Dot depende del currentPage
    // y de las propiedades de color/tamaño del modelo.
    final slideShowModel = _SlideShowNotifier.watch(context);

    final double size;
    final Color color;
    final page = slideShowModel.currentPage;

    // Lógica de selección ligeramente ajustada para manejar bordes
    final isSelected = (page >= index - 0.5 && page < index + 0.5);

    if (isSelected) {
      size = slideShowModel.dotPrimarySize;
      color = slideShowModel.dotPrimaryColor;
    } else {
      size = slideShowModel.dotSecondarySize;
      color = slideShowModel.dotSecondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final _pageViewController = PageController();
  Timer? _intervalSlider; // Hacerlo nullable
  int _currentPageIndex = 0; // Usar índice entero para lógica del timer

  @override
  void initState() {
    super.initState();

    // Usamos 'read' en initState para obtener la configuración inicial
    // sin crear una dependencia de reconstrucción aquí.
    final model = _SlideShowNotifier.read(context);

    _pageViewController.addListener(() {
      // Usamos 'read' dentro del listener para actualizar el modelo
      // sin causar reconstrucciones innecesarias en *este* widget.
      _SlideShowNotifier.read(context).currentPage =
          _pageViewController.page ?? 0;
    });

    // Iniciar el temporizador basado en la configuración inicial del modelo
    _setupTimer(model);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Si las dependencias cambian (ej. el modelo proporcionado por _SlideShowNotifier),
    // podríamos necesitar reiniciar el temporizador si la configuración de autoMove cambió.
    // Esto es más robusto que depender solo de didUpdateWidget del padre.
    final model = _SlideShowNotifier.read(context);
    // Comprobar si el estado del timer necesita actualizarse
    // if ((_intervalSlider?.isActive ?? false) != model.autoMove ||
    //     (_intervalSlider != null &&
    //         model.autoMoveDuration != _intervalSlider!.tick)) {
    if ((_intervalSlider?.isActive ?? false) != model.autoMove) {
      _setupTimer(model);
    }
  }

  void _setupTimer(_SliderModel model) {
    _intervalSlider?.cancel(); // Cancela cualquier timer existente

    if (model.autoMove && widget.slides.isNotEmpty) {
      _intervalSlider = Timer.periodic(model.autoMoveDuration, (timer) {
        _currentPageIndex =
            _pageViewController.page?.round() ?? 0; // Sincronizar índice
        // para no usar else
        int nextPageIndex = 0;

        // Usa el índice entero para la lógica de avance
        if (_currentPageIndex < widget.slides.length - 1) {
          // _currentPageIndex++;
          nextPageIndex = _currentPageIndex + 1;
        }
        // else {
        //   _currentPageIndex = 0; // Volver al inicio
        // }

        // Animar usando el PageController
        _pageViewController.animateToPage(
          // _currentPageIndex,
          nextPageIndex,
          duration: Duration(
            milliseconds: (model.autoMoveDuration.inMilliseconds * 0.3).round(),
            // milliseconds: 1000,
          ),
          curve: Curves.easeOut, // Una curva suave
        );
      });
    }
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _intervalSlider?.cancel(); // Asegurarse de cancelar el timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // No necesita acceder al modelo aquí directamente para construir
    return PageView(
      controller: _pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
      onPageChanged: (index) {
        // Actualiza el índice interno cuando el usuario desliza manualmente
        _currentPageIndex = index;
        // Podrías reiniciar el timer aquí si quieres que el auto-avance
        // se resetee después de una interacción manual.
        final model = _SlideShowNotifier.read(context);
        _setupTimer(model);
      },
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}
