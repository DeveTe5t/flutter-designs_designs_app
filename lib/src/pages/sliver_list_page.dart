import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: _TaskList(),
      // body: _Title(),
      body: Stack(
        children: [
          _MainScroll(
            title: 'Hey',
            subTitle: "What's up",
            minHeightHeader: 210,
          ),
          Positioned(bottom: -10, right: 0, child: _ButtonNewList()),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      child: MaterialButton(
        onPressed: () {},
        // color: Colors.blue,
        color: const Color(0xffED6762),
        height: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final String title;
  final String subTitle;
  final double minHeightHeader;

  final items = const [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  const _MainScroll({
    required this.title,
    required this.subTitle,
    required this.minHeightHeader,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Works like a normal app bar
        // const SliverAppBar(
        //   floating: true,
        //   // elevation: 0,
        //   backgroundColor: Colors.blue,
        //   title: Text('Hey', style: TextStyle(color: Colors.white)),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: minHeightHeader,
            maxHeight: minHeightHeader + 25,
            child: Container(
              color: Colors.white,
              // alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: _Title(title: title, subTitle: subTitle),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  // double get minExtent => (maxHeight < minHeight) ? maxHeight : minHeight;
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _TaskList extends StatelessWidget {
  final items = const [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  const _TaskList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: 20,
      itemCount: items.length,
      // itemBuilder: (context, index) => const _ListItem(),
      itemBuilder: (context, index) => items[index],
    );
    // return CustomScrollView(
    //   physics: const BouncingScrollPhysics(),
    //   slivers: [
    //     SliverPersistentHeader(
    //       floating: true,
    //       delegate: _SliverCustomHeaderDelegate(
    //         maxHeight: 200,
    //         minHeight: 180,
    //         child: Container(
    //           alignment: Alignment.topLeft,
    //           color: Colors.white,
    //           child: _Title(),
    //         ),
    //       ),
    //     ),
    //     SliverList(delegate: SliverChildListDelegate(items)),
    //   ],
    // );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  const _ListItem({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        // color: Colors.orange,
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        // 'Text',
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String subTitle;

  const _Title({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        // Container(
        // alignment: Alignment.centerLeft,
        // margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        Text(
          title,
          style: const TextStyle(color: Color(0xff532128), fontSize: 50),
        ),
        // ),
        Stack(
          children: [
            const SizedBox(width: 110),
            Positioned(
              bottom: 8,
              child: Container(
                width: 110,
                height: 8,
                color: const Color(0xffF7CDD5),
              ),
            ),
            // Container(
            // alignment: Alignment.centerLeft,
            // margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            Text(
              subTitle,
              style: const TextStyle(
                color: Color(0xffD93A30),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ),
          ],
        ),
      ],
    );
  }
}

// ------------ solution 2 ------------
// import 'package:flutter/material.dart';
// // import 'dart:developer'; // Para logs de depuración
// import 'dart:math'; // Para max()

// class SliverListPage extends StatelessWidget {
//   const SliverListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: _MainScroll());
//   }
// }

// class _MainScroll extends StatefulWidget {
//   const _MainScroll();

//   @override
//   State<_MainScroll> createState() => _MainScrollState();
// }

// class _MainScrollState extends State<_MainScroll> {
//   final items = const [
//     _ListItem(title: 'Orange', color: Color(0xffF08F66)),
//     _ListItem(title: 'Family', color: Color(0xffF2A38A)),
//     _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
//     _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
//     _ListItem(title: 'Orange', color: Color(0xffF08F66)),
//     _ListItem(title: 'Family', color: Color(0xffF2A38A)),
//     _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
//     _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
//   ];

//   final GlobalKey _titleKey = GlobalKey();

//   // Valores iniciales razonables (pueden ser 0 si prefieres, pero causa más "salto")
//   double _minHeaderHeight = 150.0;
//   double _maxHeaderHeight = 250.0; // Debe ser >= minHeaderHeight inicial

//   // Flag para evitar mediciones/setState innecesarios
//   bool _isHeightMeasured = false;

//   @override
//   void initState() {
//     super.initState();
//     // Programar la medición después del primer layout
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // Solo medir si aún no lo hemos hecho
//       if (!_isHeightMeasured) {
//         _measureTitleHeight();
//       }
//     });
//   }

//   void _measureTitleHeight() {
//     final context = _titleKey.currentContext;

//     // Comprobar si el contexto y el render object existen
//     if (context != null && context.findRenderObject() != null) {
//       final RenderBox renderBox = context.findRenderObject() as RenderBox;
//       // Asegurarse de que el renderizado tenga dimensiones
//       if (renderBox.hasSize) {
//         final measuredHeight = renderBox.size.height;

//         // Comprobar si estamos montados, la altura es válida y diferente a la actual
//         // para evitar setState innecesarios.
//         if (mounted &&
//             measuredHeight > 0 &&
//             measuredHeight != _minHeaderHeight) {
//           print('Measured Title Height: $measuredHeight');

//           setState(() {
//             // Actualizar alturas con la medida real
//             _minHeaderHeight = measuredHeight;
//             // Mantener un pequeño delta para el efecto de encogimiento, o igualarlos
//             _maxHeaderHeight =
//                 measuredHeight + 25.0; // O simplemente measuredHeight
//             _isHeightMeasured = true; // Marcar como medido
//             print(
//               'Updated Header Heights: min=$_minHeaderHeight, max=$_maxHeaderHeight',
//             );
//           });
//         }
//       } else {
//         print('RenderBox has no size yet, retrying measurement...');
//         // Si no tiene tamaño aún, reintentar en el próximo frame
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (!_isHeightMeasured) _measureTitleHeight();
//         });
//       }
//     } else {
//       print('Title context or RenderObject is null, retrying measurement...');
//       // Si el contexto no está listo, reintentar en el próximo frame
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (!_isHeightMeasured) _measureTitleHeight();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(
//       "Building with heights: min=$_minHeaderHeight, max=$_maxHeaderHeight",
//     );
//     return CustomScrollView(
//       physics: const BouncingScrollPhysics(),
//       slivers: [
//         SliverPersistentHeader(
//           floating: true, // pinned: true también funcionaría
//           delegate: _SliverCustomHeaderDelegate(
//             // Usar las alturas actualizadas del estado
//             minHeight: _minHeaderHeight,
//             maxHeight: _maxHeaderHeight,
//             // El child es el Container que envuelve a _Title.
//             // ¡IMPORTANTE! No poner 'height' aquí.
//             child: Container(
//               key:
//                   _titleKey, // La key está en el widget cuya altura queremos medir
//               color: Colors.white,
//               alignment: Alignment.centerLeft,
//               // _Title tomará su altura natural dentro de este Container
//               child: const _Title(),
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             ...items,
//             const SizedBox(height: 100),
//           ]),
//         ),
//       ],
//     );
//   }
// }

// class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   _SliverCustomHeaderDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     // SizedBox.expand fuerza al 'child' a llenar el espacio dado por
//     // minExtent/maxExtent. Es crucial que minExtent/maxExtent sean correctos.
//     return SizedBox.expand(child: child);
//   }

//   // maxExtent debe ser el valor más grande entre minHeight y maxHeight.
//   @override
//   double get maxExtent => max(minHeight, maxHeight);
//   // double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;
//   // double get maxExtent => maxHeight;

//   // minExtent debe ser el valor más pequeño.
//   @override
//   double get minExtent => minHeight; // O min(minHeight, maxHeight) si maxHeight pudiera ser menor

//   @override
//   bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
//     // Reconstruir si las alturas o el child cambian.
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }

// class _ListItem extends StatelessWidget {
//   // ... (Sin cambios)
//   final String title;
//   final Color color;
//   const _ListItem({required this.title, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 130,
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       alignment: Alignment.centerLeft,
//       child: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//         ),
//       ),
//     );
//   }
// }

// class _Title extends StatelessWidget {
//   const _Title();

//   @override
//   Widget build(BuildContext context) {
//     // Usar MainAxisSize.min para que la Columna se ajuste a su contenido verticalmente
//     return Column(
//       mainAxisSize: MainAxisSize.min, // Importante para la medición de altura
//       crossAxisAlignment:
//           CrossAxisAlignment.start, // Alinea el texto a la izquierda
//       children: [
//         const SizedBox(height: 30),
//         const Padding(
//           // Usar Padding en lugar de Container con margin si solo es espaciado
//           padding: EdgeInsets.only(
//             left: 30,
//             right: 30,
//             bottom: 10,
//           ), // Ajusta el espaciado
//           child: Text(
//             // Texto más largo para probar el wrap
//             // 'New Awesome Title With More Words',
//             'New Awesome',
//             style: TextStyle(
//               color: Color(0xff532128),
//               fontSize: 50,
//               height: 1.1, // Ayuda a controlar el espaciado entre líneas
//               // fontWeight: FontWeight.bold, // Puedes añadir si quieres
//             ),
//             // softWrap: true, // true por defecto, permite el salto de línea
//             // overflow: TextOverflow.ellipsis, // Opcional: si prefieres cortar el texto
//           ),
//         ),
//         // Añadir un Padding similar para el segundo texto
//         const Padding(
//           padding: EdgeInsets.only(
//             left: 30,
//             right: 30,
//             bottom: 20,
//           ), // Ajusta el espaciado
//           child: Text(
//             // Texto más largo para probar el wrap
//             // 'List of Many Items That Need Space',
//             'List of',
//             style: TextStyle(
//               color: Color(0xffD93A30),
//               fontSize: 50,
//               fontWeight: FontWeight.bold,
//               height: 1.1,
//             ),
//           ),
//         ),
//         // Si necesitas la línea debajo, puedes añadirla aquí
//         Padding(
//           padding: const EdgeInsets.only(left: 30),
//           child: Container(
//             width: 150, // O calcula el ancho dinámicamente si es necesario
//             height: 8,
//             color: const Color(0xffF7CDD5),
//           ),
//         ),
//         const SizedBox(height: 10), // Espacio final si es necesario
//       ],
//     );
//   }
// }
