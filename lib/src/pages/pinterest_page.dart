// way 1: with packages ------------
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// import '/src/widgets/pinterest_menu.dart';

// class _MenuModel with ChangeNotifier {
//   bool _showMenu = true;

//   bool get showMenu => _showMenu;
//   set showMenu(bool value) {
//     if (_showMenu == value) return;
//     _showMenu = value;
//     notifyListeners();
//   }
// }

// class PinterestPage extends StatelessWidget {
//   const PinterestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: ChangeNotifierProvider(
//         create: (_) => _MenuModel(),
//         child: Scaffold(
//           // body: PinterestGrid(),
//           // body: PinterestMenu(),
//           body: Stack(
//             // way 1:
//             alignment: Alignment.center,
//             children: [
//               const PinterestGrid(),
//               // way 1:
//               _PinterestMenuLocation(),
//               // way 2:
//               // _PinterestMenuLocation2(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _PinterestMenuLocation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final showMenu = Provider.of<_MenuModel>(context).showMenu;
//     return Positioned(
//       // bottom: 0,
//       bottom: 30,
//       child: PinterestMenu(
//         showMenu: showMenu,
//         backgroundColor: Colors.purple,
//         activeColor: Colors.white,
//         inactiveColor: Colors.black87,
//         items: [
//           PinterestButton(
//             onPressed: () {
//               print('Icon Pie_chart ');
//             },
//             icon: Icons.pie_chart,
//           ),
//           PinterestButton(
//             onPressed: () {
//               print('Icon Search ');
//             },
//             icon: Icons.search,
//           ),
//           PinterestButton(
//             onPressed: () {
//               print('Icon Notifications ');
//             },
//             icon: Icons.notifications,
//           ),
//           PinterestButton(
//             onPressed: () {
//               print('Icon Supervised_user_circle ');
//             },
//             icon: Icons.supervised_user_circle,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class _PinterestMenuLocation2 extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// // final screenWidth = MediaQuery.sizeOf(context).width;

// //     return Positioned(
// //       bottom: 30,
// //       child: SizedBox(width: screenWidth, child: Align(child: PinterestMenu())),
// //     );
// //   }
// // }

// class PinterestGrid extends StatefulWidget {
//   const PinterestGrid({super.key});

//   @override
//   State<PinterestGrid> createState() => _PinterestGridState();
// }

// class _PinterestGridState extends State<PinterestGrid> {
//   final List<int> items = List.generate(200, (index) => index);
//   ScrollController controller = ScrollController();
//   double beforeScroll = 0;

//   @override
//   void initState() {
//     super.initState();

//     controller.addListener(() {
//       // if (controller.offset > beforeScroll) {
//       if (controller.offset > beforeScroll && controller.offset >= 50) {
//         Provider.of<_MenuModel>(context, listen: false).showMenu = false;
//       } else {
//         // how when pull refresh or like a scroll to top and more
//         // if (controller.offset <= 0) return;
//         Provider.of<_MenuModel>(context, listen: false).showMenu = true;
//       }

//       beforeScroll = controller.offset;
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ********** With package
//     //------- Solution 1
//     // return Container(
//     //   padding: const EdgeInsets.symmetric(horizontal: 20),
//     //   child: MasonryGridView.count(
//     //     controller: controller,
//     //     crossAxisCount: 2,
//     //     mainAxisSpacing: 4,
//     //     crossAxisSpacing: 4,
//     //     // padding: const EdgeInsets.all(10),
//     //     itemCount: items.length,
//     //     itemBuilder: (context, index) {
//     //       return _Tile(index: index, extent: (index % 5 + 1) * 100);
//     //     },
//     //   ),
//     // );

//     //------- Solution 2
//     // return SingleChildScrollView(
//     //   controller: controller,
//     //   child: StaggeredGrid.count(
//     //     crossAxisCount: 4,
//     //     mainAxisSpacing: 4,
//     //     crossAxisSpacing: 4,
//     //     children: List.generate(
//     //       items.length,
//     //       (index) => _PinterestItem2(index: index),
//     //     ),
//     //   ),
//     // );

//     //------- Solution 3
//     // return GridView.custom(
//     //   controller: controller,
//     //   padding: const EdgeInsets.symmetric(horizontal: 10),
//     //   gridDelegate: SliverWovenGridDelegate.count(
//     //     crossAxisCount: 2,
//     //     pattern: [
//     //       const WovenGridTile(1),
//     //       const WovenGridTile(
//     //         5 / 7,
//     //         crossAxisRatio: 0.9,
//     //         alignment: AlignmentDirectional.centerEnd,
//     //       ),
//     //     ],
//     //   ),
//     //   childrenDelegate: SliverChildBuilderDelegate(
//     //     (context, index) => _PinterestItem(index: index),
//     //     childCount: items.length,
//     //   ),
//     // );

//     //------- Solution 4
// return GridView.custom(
//   controller: controller,
//   padding: const EdgeInsets.symmetric(horizontal: 10),
//   gridDelegate: SliverQuiltedGridDelegate(
//     crossAxisCount: 4,
//     mainAxisSpacing: 4,
//     crossAxisSpacing: 4,
//     repeatPattern: QuiltedGridRepeatPattern.inverted,
//     pattern: const [QuiltedGridTile(3, 2), QuiltedGridTile(2, 2)],
//   ),
//   childrenDelegate: SliverChildBuilderDelegate(
//     (context, index) => _PinterestItem(index: index),
//     childCount: items.length,
//   ),
// );
//   }
// }

// // class _Tile extends StatelessWidget {
// //   const _Tile({required this.index, required this.extent});
// //   final int index;
// //   final double extent;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: extent,
// //       decoration: const BoxDecoration(
// //         color: Colors.blue,
// //         borderRadius: BorderRadius.all(Radius.circular(30)),
// //       ),
// //       child: Center(
// //         child: CircleAvatar(
// //           backgroundColor: Colors.white,
// //           child: Text('$index'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class _PinterestItem extends StatelessWidget {
//   final int index;
//   const _PinterestItem({required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: const EdgeInsets.all(5),
//       decoration: const BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.all(Radius.circular(30)),
//       ),
//       child: Center(
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           child: Text('$index'),
//         ),
//       ),
//     );
//   }
// }

// // class _PinterestItem2 extends StatelessWidget {
// //   final int index;
// //   const _PinterestItem2({required this.index});

// //   @override
// //   Widget build(BuildContext context) {
// //     return StaggeredGridTile.count(
// //       crossAxisCellCount: 2,
// //       mainAxisCellCount: index.isEven ? 2 : 3,
// //       child: Container(
// //         margin: const EdgeInsets.all(5),
// //         decoration: const BoxDecoration(
// //           color: Colors.blue,
// //           borderRadius: BorderRadius.all(Radius.circular(30)),
// //         ),
// //         child: Center(
// //           child: CircleAvatar(
// //             backgroundColor: Colors.white,
// //             child: Text('$index'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// way 2: without packages ------------
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/src/widgets/pinterest_menu.dart';
import '/src/theme/theme_changer.dart';

class _MenuModel with ChangeNotifier {
  bool _showMenu = true;

  bool get showMenu => _showMenu;
  set showMenu(bool value) {
    if (_showMenu == value) return;
    _showMenu = value;
    notifyListeners();
  }
}

class _PinterestPageNotifier extends InheritedNotifier<_MenuModel> {
  const _PinterestPageNotifier({
    required _MenuModel model,
    required super.child,
  }) : super(notifier: model);

  static _MenuModel watch(BuildContext context) {
    final notifier =
        context
            .dependOnInheritedWidgetOfExactType<_PinterestPageNotifier>()
            ?.notifier;
    assert(notifier != null, 'No _PinterestPageNotifier found in context');
    return notifier!;
  }

  static _MenuModel read(BuildContext context) {
    final widget =
        context
            .getElementForInheritedWidgetOfExactType<_PinterestPageNotifier>()
            ?.widget;
    assert(widget != null, 'No _PinterestPageNotifier found in context');
    return (widget as _PinterestPageNotifier).notifier!;
  }
}

class PinterestPage extends StatefulWidget {
  const PinterestPage({super.key});

  @override
  State<PinterestPage> createState() => _PinterestPageState();
}

class _PinterestPageState extends State<PinterestPage> {
  late _MenuModel _menuModel;

  @override
  void initState() {
    super.initState();
    _menuModel = _MenuModel();
  }

  @override
  void dispose() {
    _menuModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: _PinterestPageNotifier(
        model: _menuModel,
        child: Scaffold(
          // body: PinterestGrid(),
          // body: PinterestMenu(),
          body: Stack(
            // way 1:
            alignment: Alignment.center,
            children: [
              const PinterestGrid(),
              // way 1:
              _PinterestMenuLocation(),
              // way 2:
              // _PinterestMenuLocation2(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final showMenu = _PinterestPageNotifier.watch(context).showMenu;
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;

    return Positioned(
      // bottom: 0,
      bottom: 30,
      child: PinterestMenu(
        showMenu: showMenu,

        // backgroundColor: Colors.green,
        // activeColor: Colors.white,
        // inactiveColor: Colors.black45,
        backgroundColor: appTheme.scaffoldBackgroundColor,
        activeColor: appTheme.colorScheme.primary,
        inactiveColor: Colors.blueGrey,
        items: [
          PinterestButton(
            onPressed: () {
              print('Icon Pie_chart ');
            },
            icon: Icons.pie_chart,
          ),
          PinterestButton(
            onPressed: () {
              print('Icon Search ');
            },
            icon: Icons.search,
          ),
          PinterestButton(
            onPressed: () {
              print('Icon Notifications ');
            },
            icon: Icons.notifications,
          ),
          PinterestButton(
            onPressed: () {
              print('Icon Supervised_user_circle ');
            },
            icon: Icons.supervised_user_circle,
          ),
        ],
      ),
    );
  }
}

// class _PinterestMenuLocation2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Positioned(
//       bottom: 30,
//       child: SizedBox(width: screenWidth, child: Align(child: PinterestMenu())),
//     );
//   }
// }

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double beforeScroll = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      // if (controller.offset > beforeScroll) {
      if (controller.offset > beforeScroll && controller.offset >= 50) {
        _PinterestPageNotifier.read(context).showMenu = false;
      } else {
        // how when pull refresh or like a scroll to top and more
        // if (controller.offset <= 0) return;
        _PinterestPageNotifier.read(context).showMenu = true;
      }

      beforeScroll = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ********** With package
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 0 || constraints.maxHeight <= 0) {
          // You can show a CircularProgressIndicator or a SizedBox.shrink().
          return const Center(child: CircularProgressIndicator());
        }

        int columnCount = 2;
        if (MediaQuery.sizeOf(context).width > 500) {
          columnCount = 3;
        } else {
          columnCount = 2;
        }

        //------- Solution 1
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MasonryGridView.count(
            controller: controller,
            // colums
            crossAxisCount: columnCount,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            // padding: const EdgeInsets.all(10),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _Tile(index: index, extent: (index % 5 + 1) * 100);
            },
          ),
        );

        //------- Solution 2
        // return SingleChildScrollView(
        //   controller: controller,
        //   child: StaggeredGrid.count(
        //     // when _PinterestItem2, crossAxisCellCount = 2
        //     // 4 = 2 col, 6 = 3 col
        //     // crossAxisCount / crossAxisCellCount
        //     crossAxisCount: columnCount * 2,
        //     mainAxisSpacing: 4,
        //     crossAxisSpacing: 4,
        //     children: List.generate(
        //       items.length,
        //       (index) => _PinterestItem2(index: index),
        //     ),
        //   ),
        // );

        //------- Solution 3
        // return GridView.custom(
        //   controller: controller,
        //   padding: const EdgeInsets.symmetric(horizontal: 10),
        //   gridDelegate: SliverWovenGridDelegate.count(
        //     crossAxisCount: 2,
        //     pattern: [
        //       const WovenGridTile(1),
        //       const WovenGridTile(
        //         5 / 7,
        //         crossAxisRatio: 0.9,
        //         alignment: AlignmentDirectional.centerEnd,
        //       ),
        //     ],
        //   ),
        //   childrenDelegate: SliverChildBuilderDelegate(
        //     (context, index) => _PinterestItem(index: index),
        //     childCount: items.length,
        //   ),
        // );

        //------- Solution 4
        // return GridView.custom(
        //   controller: controller,
        //   padding: const EdgeInsets.symmetric(horizontal: 10),
        //   gridDelegate: SliverQuiltedGridDelegate(
        //     crossAxisCount: 4,
        //     mainAxisSpacing: 4,
        //     crossAxisSpacing: 4,
        //     repeatPattern: QuiltedGridRepeatPattern.mirrored,
        //     pattern: const [QuiltedGridTile(3, 2), QuiltedGridTile(2, 2)],
        //   ),
        //   childrenDelegate: SliverChildBuilderDelegate(
        //     (context, index) => _PinterestItem(index: index),
        //     childCount: items.length,
        //   ),
        // );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.index, required this.extent});
  final int index;
  final double extent;

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context);

    return Container(
      height: extent,
      decoration: BoxDecoration(
        // color: Colors.blue,
        color: appTheme.currentTheme.colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index', style: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

// class _PinterestItem extends StatelessWidget {
//   final int index;
//   const _PinterestItem({required this.index});

//   @override
//   Widget build(BuildContext context) {
//     final appTheme = ThemeChangerNotifier.watch(context);

//     return Container(
//       // margin: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         // color: Colors.blue,
//         // color:
//         //     appTheme.darkTheme
//         //         ? appTheme.currentTheme.colorScheme.onPrimary
//         //         : appTheme.currentTheme.colorScheme.primary,
//         color: appTheme.currentTheme.colorScheme.primary,
//         borderRadius: const BorderRadius.all(Radius.circular(30)),
//       ),
//       child: Center(
//         child: CircleAvatar(
//           backgroundColor: Colors.white,
//           // backgroundColor: appTheme.currentTheme.colorScheme.onPrimaryContainer,
//           child: Text('$index', style: const TextStyle(color: Colors.black)),
//         ),
//       ),
//     );
//   }
// }

class _PinterestItem2 extends StatelessWidget {
  final int index;
  const _PinterestItem2({required this.index});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context);

    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: index.isEven ? 2 : 3,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          // color: Colors.blue,
          color: appTheme.currentTheme.colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index', style: const TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
