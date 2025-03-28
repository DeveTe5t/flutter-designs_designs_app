// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AutoMoveConfig {
//   final bool loop;
//   final Duration duration;

//   const AutoMoveConfig({
//     this.loop = false,
//     this.duration = const Duration(seconds: 2),
//   });
// }

// class SlideShow extends StatelessWidget {
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
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => _SliderModel(),
//       // ..dotPrimaryColor = dotPrimaryColor
//       // ..dotSecondaryColor = dotSecondaryColor
//       // ..dotPrimarySize = dotPrimarySize
//       // ..dotSecondarySize = dotSecondarySize,
//       child: SafeArea(
//         child: Center(
//           child: Builder(
//             builder: (BuildContext context) {
//               Provider.of<_SliderModel>(context).dotPrimaryColor =
//                   dotPrimaryColor;
//               Provider.of<_SliderModel>(context).dotSecondaryColor =
//                   dotSecondaryColor;
//               Provider.of<_SliderModel>(context).dotPrimarySize =
//                   dotPrimarySize;
//               Provider.of<_SliderModel>(context).dotSecondarySize =
//                   dotSecondarySize;
//               Provider.of<_SliderModel>(context).dotsUp = dotsUp;
//               Provider.of<_SliderModel>(context).autoMove = autoMoveConfig.loop;
//               Provider.of<_SliderModel>(context).autoMoveDuration =
//                   autoMoveConfig.duration;

//               return _CreateSlideShowStructure(slides: slides);
//             },
//           ),
//           // child: _CreateSlideShowStructure(slides: slides),
//         ),
//       ),
//     );
//   }
// }

// class _CreateSlideShowStructure extends StatelessWidget {
//   const _CreateSlideShowStructure({required this.slides});

//   final List<Widget> slides;

//   @override
//   Widget build(BuildContext context) {
//     final slideDotsUp = Provider.of<_SliderModel>(context).dotsUp;
//     return Column(
//       children: [
//         if (slideDotsUp) _Dots(slides.length),

//         Expanded(child: _Slides(slides)),

//         if (!slideDotsUp) _Dots(slides.length),
//       ],
//     );
//   }
// }

// class _Dots extends StatelessWidget {
//   final int totalDots;
//   const _Dots(this.totalDots);

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
//               children: List.generate(totalDots, (i) => _Dot(i)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   final int index;
//   const _Dot(this.index);

//   @override
//   Widget build(BuildContext context) {
//     final slideShowModel = Provider.of<_SliderModel>(context);

//     final double size;
//     final Color color;

//     if (slideShowModel.currentPage >= index - 0.5 &&
//         slideShowModel.currentPage < index + 0.5) {
//       size = slideShowModel.dotPrimarySize;
//       color = slideShowModel.dotPrimaryColor;
//     } else {
//       size = slideShowModel.dotSecondarySize;
//       color = slideShowModel.dotSecondaryColor;
//     }

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: size,
//       height: size,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//     );
//   }
// }

// class _Slides extends StatefulWidget {
//   final List<Widget> slides;
//   const _Slides(this.slides);

//   @override
//   State<_Slides> createState() => _SlidesState();
// }

// class _SlidesState extends State<_Slides> {
//   final _pageViewController = PageController();
//   late Timer _intervalSlider;
//   int _currentPage = 0;
//   late bool _autoMove;
//   late Duration _autoMoveDuration;

//   @override
//   void initState() {
//     super.initState();

//     _autoMove = Provider.of<_SliderModel>(context, listen: false).autoMove;
//     _autoMoveDuration =
//         Provider.of<_SliderModel>(context, listen: false).autoMoveDuration;

//     _pageViewController.addListener(() {
//       // listen: false in initState
//       Provider.of<_SliderModel>(context, listen: false).currentPage =
//           _pageViewController.page ?? 0;
//     });

//     if (!_autoMove) return;

//     _intervalSlider = Timer.periodic(_autoMoveDuration, (timer) {
//       // way 2
//       if (_currentPage < widget.slides.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }

//       _pageViewController.animateToPage(
//         _currentPage,
//         duration: (_autoMoveDuration * 0.5),
//         curve: Curves.easeInOut,
//       );

//       // way 1
//       // if (pageViewController.page == widget.slides.length - 1) {
//       //   pageViewController.jumpToPage(0);
//       // } else {
//       //   // No animation
//       //   // pageViewController.jumpToPage(pageViewController.page!.toInt() + 1);

//       //   // With animation
//       //   // pageViewController.nextPage(
//       //   //   duration: const Duration(milliseconds: 1000),
//       //   //   curve: Curves.easeInOut,
//       //   // );
//       //   pageViewController.animateToPage(
//       //     pageViewController.page!.toInt() + 1,
//       //     duration: const Duration(milliseconds: 1000),
//       //     curve: Curves.easeInOut,
//       //   );
//       // }
//     });
//   }

//   @override
//   void dispose() {
//     _pageViewController.dispose();
//     _intervalSlider.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _pageViewController,
//       children: widget.slides.map((slide) => _Slide(slide)).toList(),
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

// class _SliderModel with ChangeNotifier {
//   double _currentPage = 0;
//   bool dotsUp = false;
//   Color dotPrimaryColor = Colors.blue;
//   Color dotSecondaryColor = Colors.grey;
//   double dotPrimarySize = 12;
//   double dotSecondarySize = 12;
//   bool autoMove = false;
//   Duration autoMoveDuration = const Duration(seconds: 2);

//   double get currentPage => _currentPage;
//   set currentPage(double currentPage) {
//     _currentPage = currentPage;
//     notifyListeners();
//   }
// }

// -------------------------------------------------------
// import 'dart:async';
// import 'package:flutter/material.dart';

// class AutoMoveConfig {
//   final bool loop;
//   final Duration duration;

//   const AutoMoveConfig({
//     this.loop = false,
//     this.duration = const Duration(seconds: 2),
//   });
// }

// class SlideShow extends StatelessWidget {
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
//   Widget build(BuildContext context) {
//     return _SliderModelInheritedWidget(
//       model:
//           _SliderModel()
//             ..dotPrimaryColor = dotPrimaryColor
//             ..dotSecondaryColor = dotSecondaryColor
//             ..dotPrimarySize = dotPrimarySize
//             ..dotSecondarySize = dotSecondarySize
//             ..dotsUp = dotsUp
//             ..autoMove = autoMoveConfig.loop
//             ..autoMoveDuration = autoMoveConfig.duration,
//       child: SafeArea(
//         child: Center(child: _CreateSlideShowStructure(slides: slides)),
//       ),
//     );
//   }
// }

// class _CreateSlideShowStructure extends StatelessWidget {
//   const _CreateSlideShowStructure({required this.slides});

//   final List<Widget> slides;

//   @override
//   Widget build(BuildContext context) {
//     final slideDotsUp = _SliderModelInheritedWidget.of(context).model.dotsUp;
//     return Column(
//       children: [
//         if (slideDotsUp) _Dots(slides.length),
//         Expanded(child: _Slides(slides)),
//         if (!slideDotsUp) _Dots(slides.length),
//       ],
//     );
//   }
// }

// class _Dots extends StatelessWidget {
//   final int totalDots;
//   const _Dots(this.totalDots);

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
//               children: List.generate(totalDots, (i) => _Dot(i)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   final int index;
//   const _Dot(this.index);

//   @override
//   Widget build(BuildContext context) {
//     final slideShowModel = _SliderModelInheritedWidget.of(context).model;

//     final double size;
//     final Color color;

//     if (slideShowModel.currentPage >= index - 0.5 &&
//         slideShowModel.currentPage < index + 0.5) {
//       size = slideShowModel.dotPrimarySize;
//       color = slideShowModel.dotPrimaryColor;
//     } else {
//       size = slideShowModel.dotSecondarySize;
//       color = slideShowModel.dotSecondaryColor;
//     }

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: size,
//       height: size,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//     );
//   }
// }

// class _Slides extends StatefulWidget {
//   final List<Widget> slides;
//   const _Slides(this.slides);

//   @override
//   State<_Slides> createState() => _SlidesState();
// }

// class _SlidesState extends State<_Slides> {
//   final _pageViewController = PageController();
//   late Timer _intervalSlider;
//   int _currentPage2 = 0;
//   late bool _autoMove;
//   late Duration _autoMoveDuration;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     final model = _SliderModelInheritedWidget.of(context).model;
//     _autoMove = model.autoMove;
//     _autoMoveDuration = model.autoMoveDuration;

//     _pageViewController.addListener(() {
//       _SliderModelInheritedWidget.of(context).model.currentPage =
//           _pageViewController.page ?? 0;
//       // model.currentPage = _pageViewController.page ?? 0;
//     });

//     if (!_autoMove) return;

//     _intervalSlider = Timer.periodic(_autoMoveDuration, (timer) {
//       // print('Before: $_currentPage2');
//       if (_currentPage2 < widget.slides.length - 1) {
//         _currentPage2++;
//       } else {
//         _currentPage2 = 0;
//       }

//       _pageViewController.animateToPage(
//         _currentPage2,
//         // duration: (_autoMoveDuration * 0.5),
//         duration: const Duration(milliseconds: 1000),
//         curve: Curves.easeInOut,
//       );

//       // print('After: $_currentPage2');
//     });
//   }

//   @override
//   void dispose() {
//     _pageViewController.dispose();
//     _intervalSlider.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(
//       'HEY => $_currentPage2, ${_SliderModelInheritedWidget.of(context).model.currentPage}',
//     );
//     // print('${_pageViewController.page}');
//     return PageView(
//       controller: _pageViewController,
//       children: widget.slides.map((slide) => _Slide(slide)).toList(),
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

// class _SliderModel with ChangeNotifier {
//   double _currentPage = 0.0;
//   bool dotsUp = false;
//   Color dotPrimaryColor = Colors.blue;
//   Color dotSecondaryColor = Colors.grey;
//   double dotPrimarySize = 12;
//   double dotSecondarySize = 12;
//   bool autoMove = false;
//   Duration autoMoveDuration = const Duration(seconds: 2);

//   double get currentPage => _currentPage;
//   set currentPage(double currentPage) {
//     _currentPage = currentPage;
//     notifyListeners();
//   }
// }

// class _SliderModelInheritedWidget extends InheritedWidget {
//   final _SliderModel model;

//   const _SliderModelInheritedWidget({
//     required this.model,
//     required super.child,
//   });

//   static _SliderModelInheritedWidget of(BuildContext context) {
//     final _SliderModelInheritedWidget? result =
//         context
//             .dependOnInheritedWidgetOfExactType<_SliderModelInheritedWidget>();
//     assert(result != null, 'No _SliderModelInheritedWidget found in context');
//     return result!;
//   }

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     return true; // You can add logic here if you want to update when state changes
//   }

//   // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//   // return (oldWidget as _SliderModelInheritedWidget).model != model;
//   // }
//   // bool updateShouldNotify(covariant _SliderModelInheritedWidget oldWidget) {
//   //   // return (oldWidget as _SliderModelInheritedWidget).model != model;
//   //   return (oldWidget.model.currentPage != model.currentPage);
//   //   // return false;
//   // }
// }

// --------------------------------------------------------
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
//   set dotsUp(bool value) {
//     if (_dotsUp == value) return;
//     _dotsUp = value;
//     notifyListeners();
//   }

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

// --------------------------------------------------------
import 'dart:async';
import 'package:flutter/material.dart';

// --- Configuración y Modelo ---
class AutoMoveConfig {
  final bool loop;
  final Duration duration;

  const AutoMoveConfig({
    this.loop = false,
    this.duration = const Duration(seconds: 2),
  });
}

// _SliderModel ahora es un ChangeNotifier estándar
class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  bool _dotsUp = false;
  Color _dotPrimaryColor = Colors.blue;
  Color _dotSecondaryColor = Colors.grey;
  double _dotPrimarySize = 12;
  double _dotSecondarySize = 12;
  bool _autoMove = false;
  Duration _autoMoveDuration = const Duration(seconds: 2);

  // Método para inicializar/actualizar las propiedades de configuración
  void updateConfig({
    required bool dotsUp,
    required Color dotPrimaryColor,
    required Color dotSecondaryColor,
    required double dotPrimarySize,
    required double dotSecondarySize,
    required bool autoMove,
    required Duration autoMoveDuration,
  }) {
    _dotsUp = dotsUp;
    _dotPrimaryColor = dotPrimaryColor;
    _dotSecondaryColor = dotSecondaryColor;
    _dotPrimarySize = dotPrimarySize;
    _dotSecondarySize = dotSecondarySize;
    _autoMove = autoMove;
    _autoMoveDuration = autoMoveDuration;
    // No se necesita notifyListeners() aquí si estos valores
    // solo se leen una vez o no cambian después de la inicialización.
    // Si pudieran cambiar dinámicamente y afectar la UI,
    // se debería llamar a notifyListeners() o gestionar su actualización
    // de forma más específica.
  }

  // Necesitarás una forma de actualizar autoMove y su duración también
  void updateAutoMove(AutoMoveConfig config) {
    bool configChanged =
        _autoMove != config.loop || _autoMoveDuration != config.duration;
    if (!configChanged) return;
    _autoMove = config.loop;
    _autoMoveDuration = config.duration;
    // No necesariamente notificar aquí, la lógica del Timer reaccionará
    // Pero si alguna UI depende DIRECTAMENTE de _autoMove, notifica.
    // notifyListeners();
  }

  // Método inicial para configurar todo sin notificar (usado en initState)
  void initializeConfig({
    required bool dotsUp,
    required Color dotPrimaryColor,
    required Color dotSecondaryColor,
    required double dotPrimarySize,
    required double dotSecondarySize,
    required AutoMoveConfig autoMoveConfig,
  }) {
    _dotsUp = dotsUp;
    _dotPrimaryColor = dotPrimaryColor;
    _dotSecondaryColor = dotSecondaryColor;
    _dotPrimarySize = dotPrimarySize;
    _dotSecondarySize = dotSecondarySize;
    _autoMove = autoMoveConfig.loop;
    _autoMoveDuration = autoMoveConfig.duration;
    // No notifyListeners() aquí
  }

  double get currentPage => _currentPage;
  set currentPage(double value) {
    // Evita notificaciones innecesarias si el valor no cambia
    if (_currentPage == value) return;
    _currentPage = value;
    notifyListeners(); // Notifica a los oyentes (como AnimatedBuilder)
  }

  set dotsUp(bool value) {
    if (_dotsUp == value) return;
    _dotsUp = value;
    notifyListeners();
  }

  set dotPrimaryColor(Color value) {
    if (_dotPrimaryColor == value) return;
    _dotPrimaryColor = value;
    notifyListeners();
  }

  set dotSecondaryColor(Color value) {
    if (_dotSecondaryColor == value) return;
    _dotSecondaryColor = value;
    notifyListeners();
  }

  set dotPrimarySize(double value) {
    if (_dotPrimarySize == value) return;
    _dotPrimarySize = value;
    notifyListeners();
  }

  set dotSecondarySize(double value) {
    if (_dotSecondarySize == value) return;
    _dotSecondarySize = value;
    notifyListeners();
  }
  // Getters para las otras propiedades (no necesitan setters con notifyListeners
  // si solo se establecen una vez al inicio)

  bool get dotsUp => _dotsUp;
  Color get dotPrimaryColor => _dotPrimaryColor;
  Color get dotSecondaryColor => _dotSecondaryColor;
  double get dotPrimarySize => _dotPrimarySize;
  double get dotSecondarySize => _dotSecondarySize;
  bool get autoMove => _autoMove;
  Duration get autoMoveDuration => _autoMoveDuration;
}

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

// --- _SlideShowState ---
class _SlideShowState extends State<SlideShow> {
  late final _SliderModel _sliderModel;
  late final PageController _pageViewController;
  Timer? _autoMoveTimer; // Mover el Timer aquí

  @override
  void initState() {
    super.initState();
    _sliderModel = _SliderModel();
    _pageViewController = PageController();

    // Inicializa el modelo
    _sliderModel.initializeConfig(
      dotsUp: widget.dotsUp,
      dotPrimaryColor: widget.dotPrimaryColor,
      dotSecondaryColor: widget.dotSecondaryColor,
      dotPrimarySize: widget.dotPrimarySize,
      dotSecondarySize: widget.dotSecondarySize,
      autoMoveConfig: widget.autoMoveConfig,
    );

    _pageViewController.addListener(() {
      _sliderModel.currentPage = _pageViewController.page ?? 0;
    });

    // Iniciar el Timer inicial si es necesario
    _setupAutoMoveTimer();
  }

  @override
  void didUpdateWidget(covariant SlideShow oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Compara y actualiza las propiedades del modelo si han cambiado
    if (widget.dotsUp != oldWidget.dotsUp) {
      _sliderModel.dotsUp = widget.dotsUp; // Usa el setter que notifica
    }
    if (widget.dotPrimaryColor != oldWidget.dotPrimaryColor) {
      // Asumiendo setters similares para los demás...
      _sliderModel.dotPrimaryColor = widget.dotPrimaryColor;
    }
    if (widget.dotSecondaryColor != oldWidget.dotSecondaryColor) {
      _sliderModel.dotSecondaryColor = widget.dotSecondaryColor;
    }
    if (widget.dotPrimarySize != oldWidget.dotPrimarySize) {
      _sliderModel.dotPrimarySize = widget.dotPrimarySize;
    }
    if (widget.dotSecondarySize != oldWidget.dotSecondarySize) {
      _sliderModel.dotSecondarySize = widget.dotSecondarySize;
    }

    // Compara y actualiza la configuración de autoMove y reinicia el Timer
    if (widget.autoMoveConfig != oldWidget.autoMoveConfig) {
      _sliderModel.updateAutoMove(widget.autoMoveConfig);
      _setupAutoMoveTimer(); // Reinicia el timer con la nueva config
    }
  }

  void _setupAutoMoveTimer() {
    _autoMoveTimer?.cancel(); // Cancela el timer anterior si existe
    _autoMoveTimer = null;

    if (_sliderModel.autoMove && widget.slides.isNotEmpty) {
      _autoMoveTimer = Timer.periodic(_sliderModel.autoMoveDuration, (timer) {
        // La lógica del PageView sigue igual, pero usa _pageViewController
        int currentPage = _pageViewController.page?.round() ?? 0;
        int nextPage = 0;

        if (currentPage < widget.slides.length - 1) {
          nextPage = currentPage + 1;
        } // else nextPage sigue siendo 0 (loop)

        _pageViewController.animateToPage(
          nextPage,
          duration: const Duration(
            milliseconds: 1000,
          ), // O ajusta según necesites
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _autoMoveTimer?.cancel();
    _pageViewController.dispose();
    _sliderModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // El build sigue igual, pasa el modelo y el controller
    return SafeArea(
      child: Center(
        child: _CreateSlideShowStructure(
          slides: widget.slides,
          sliderModel: _sliderModel,
          pageViewController: _pageViewController,
        ),
      ),
    );
  }
}

class _CreateSlideShowStructure extends StatelessWidget {
  final List<Widget> slides;
  final _SliderModel sliderModel; // Recibe el modelo
  final PageController pageViewController; // Recibe el controller

  const _CreateSlideShowStructure({
    required this.slides,
    required this.sliderModel,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    // Accede a 'dotsUp' directamente desde el modelo recibido
    final slideDotsUp = sliderModel.dotsUp;

    return Column(
      children: [
        // Pasa el modelo a _Dots si está arriba
        if (slideDotsUp)
          _Dots(totalDots: slides.length, sliderModel: sliderModel),

        // Pasa los slides, el modelo y el controller a _Slides
        Expanded(
          child: _Slides(
            slides: slides,
            // sliderModel: sliderModel,
            pageViewController: pageViewController, // Pasa el controller aquí
          ),
        ),

        // Pasa el modelo a _Dots si está abajo
        if (!slideDotsUp)
          _Dots(totalDots: slides.length, sliderModel: sliderModel),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalDots;
  final _SliderModel sliderModel; // Recibe el modelo

  const _Dots({required this.totalDots, required this.sliderModel});

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
              // Pasa el modelo a cada _Dot
              children: List.generate(
                totalDots,
                (i) => _Dot(index: i, sliderModel: sliderModel),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final _SliderModel sliderModel; // Recibe el modelo

  const _Dot({required this.index, required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    // Usamos AnimatedBuilder para escuchar cambios SOLO en _sliderModel
    // y reconstruir SOLO este widget (_Dot) cuando sea necesario (cambie currentPage)
    return AnimatedBuilder(
      animation: sliderModel, // Escucha al _SliderModel
      builder: (context, child) {
        // La lógica para determinar tamaño y color se mueve aquí dentro
        final double size;
        final Color color;

        if (sliderModel.currentPage >= index - 0.5 &&
            sliderModel.currentPage < index + 0.5) {
          size = sliderModel.dotPrimarySize;
          color = sliderModel.dotPrimaryColor;
        } else {
          size = sliderModel.dotSecondarySize;
          color = sliderModel.dotSecondaryColor;
        }

        // Devuelve el AnimatedContainer, que se reconstruirá eficientemente
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: size,
          height: size,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        );
      },
    );
  }
}

// --- _Slides Widget ---
// Ya NO necesita gestionar el Timer ni ser StatefulWidget si el Timer se maneja arriba
class _Slides extends StatelessWidget {
  // Puede ser StatelessWidget ahora
  final List<Widget> slides;
  // Ya no necesita el sliderModel si no lee nada más de él directamente
  // final _SliderModel sliderModel;
  final PageController pageViewController; // Sigue necesitando el controller

  const _Slides({
    required this.slides,
    // required this.sliderModel,
    required this.pageViewController,
  });

  // initState y dispose relacionados al Timer se eliminan

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController, // Usa el controller pasado
      children: slides.map((slide) => _Slide(slide)).toList(),
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
