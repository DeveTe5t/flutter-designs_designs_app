// way 1: with provider package ------------
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PinterestButton {
//   // final Function onPressed;
//   final VoidCallback onPressed;
//   final IconData icon;

//   PinterestButton({required this.onPressed, required this.icon});
// }

// class PinterestMenu extends StatelessWidget {
//   final bool showMenu;
//   final Color backgroundColor;
//   final Color activeColor;
//   final Color inactiveColor;
//   final List<PinterestButton> items;

//   const PinterestMenu({
//     super.key,
//     this.showMenu = true,
//     this.backgroundColor = Colors.white,
//     this.activeColor = Colors.black,
//     this.inactiveColor = Colors.blueGrey,
//     required this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => _OptionsMenuModel(),
//       child: AnimatedOpacity(
//         opacity: showMenu ? 1 : 0,
//         duration: const Duration(milliseconds: 500),
//         // curve: Curves.easeInOut,
//         // child: _PinterestMenuBackground(child: _MenuItems(menuItems: items)),
//         child: IgnorePointer(
//           ignoring: !showMenu,
//           // child: _PinterestMenuBackground(child: _MenuItems(items)),
//           child: Builder(
//             builder: (BuildContext context) {
//               Provider.of<_OptionsMenuModel>(context).backgroundColor =
//                   backgroundColor;
//               Provider.of<_OptionsMenuModel>(context).activeColor = activeColor;
//               Provider.of<_OptionsMenuModel>(context).inactiveColor =
//                   inactiveColor;

//               return _PinterestMenuBackground(child: _MenuItems(items));
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _PinterestMenuBackground extends StatelessWidget {
//   final Widget child;
//   const _PinterestMenuBackground({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     final backgroundColorMenu =
//         Provider.of<_OptionsMenuModel>(context).backgroundColor;

//     return Container(
//       width: 250,
//       height: 60,
//       decoration: BoxDecoration(
//         // color: Colors.white,
//         color: backgroundColorMenu,
//         borderRadius: const BorderRadius.all(Radius.circular(100)),
//         boxShadow: [
//           const BoxShadow(
//             // color: Colors.black38.withValues(alpha: 0.3),
//             color: Colors.black38,
//             // offset: const Offset(0, 0),
//             blurRadius: 10,
//             spreadRadius: -5,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
// }

// class _MenuItems extends StatelessWidget {
//   final List<PinterestButton> menuItems;
//   const _MenuItems(this.menuItems);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(
//         menuItems.length,
//         (index) => _PinterestMenuButton(index, menuItems[index]),
//       ),
//     );
//   }
// }

// class _PinterestMenuButton extends StatelessWidget {
//   final int index;
//   final PinterestButton menuItem;
//   const _PinterestMenuButton(this.index, this.menuItem);

//   @override
//   Widget build(BuildContext context) {
//     // final selectedItem = Provider.of<_OptionsMenuModel>(context).selectedIndex;
//     // final isItemSelected = selectedItem == index;
//     final itemMenu = Provider.of<_OptionsMenuModel>(context);
//     final isItemSelected = itemMenu.selectedIndex == index;

//     // way 1
//     // return IconButton(
//     //   // onPressed: () => menuItem.onPressed(),
//     //   onPressed: () {
//     //     Provider.of<_OptionsMenuModel>(context, listen: false).selectedIndex = index;
//     //     menuItem.onPressed();
//     //   },
//     //   icon: Icon(
//     //     menuItem.icon,
//     //     color: isItemSelected ? Colors.black : Colors.blueGrey,
//     //     size: isItemSelected ? 35 : 25,
//     //   ),
//     // );

//     return IconButton(
//       onPressed: () {
//         Provider.of<_OptionsMenuModel>(context, listen: false).selectedIndex =
//             index;
//         menuItem.onPressed();
//       },
//       icon: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         curve: Curves.easeInOut,
//         width: isItemSelected ? 35 : 25,
//         height: isItemSelected ? 35 : 25,
//         child: Icon(
//           menuItem.icon,
//           size: isItemSelected ? 35 : 25,
//           // color: isItemSelected ? Colors.black : Colors.blueGrey,
//           color: isItemSelected ? itemMenu.activeColor : itemMenu.inactiveColor,
//         ),
//       ),
//     );

//     // way 2
//     // return GestureDetector(
//     //   onTap: () {
//     //     // important listen: false indoor method
//     //     Provider.of<_OptionsMenuModel>(context, listen: false).selectedIndex = index;
//     //     menuItem.onPressed();
//     //   },
//     //   // for some old devices
//     //   behavior: HitTestBehavior.translucent,
//     //   child: SizedBox(
//     //     child: Icon(
//     //       menuItem.icon,
//     //       size: isItemSelected ? 35 : 25,
//     //       color: isItemSelected ? Colors.black : Colors.blueGrey,
//     //     ),
//     //   ),
//     // );

//     // return GestureDetector(
//     //   onTap: () {
//     //     Provider.of<_OptionsMenuModel>(context, listen: false).selectedIndex = index;
//     //     menuItem.onPressed();
//     //   },
//     //   behavior: HitTestBehavior.translucent,
//     //   child: AnimatedContainer(
//     //     duration: const Duration(milliseconds: 250),
//     //     curve: Curves.easeInOut,
//     //     width: isItemSelected ? 35 : 25,
//     //     height: isItemSelected ? 35 : 25,
//     //     child: Icon(
//     //       menuItem.icon,
//     //       size: isItemSelected ? 35 : 25,
//     //       color: isItemSelected ? Colors.black : Colors.blueGrey,
//     //     ),
//     //   ),
//     // );
//   }
// }

// class _OptionsMenuModel with ChangeNotifier {
//   int _selectedIndex = 0;
//   Color backgroundColor = Colors.white;
//   Color activeColor = Colors.black;
//   Color inactiveColor = Colors.blueGrey;

//   int get selectedIndex => _selectedIndex;
//   set selectedIndex(int index) {
//     if (_selectedIndex == index) return;
//     _selectedIndex = index;
//     notifyListeners();
//   }
// }

// way 2: without packages ------------
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class _OptionsMenuModel with ChangeNotifier {
  int _selectedIndex = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  void initializeConfig({
    required Color backgroundColor,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    _backgroundColor = backgroundColor;
    _activeColor = activeColor;
    _inactiveColor = inactiveColor;
  }

  int get selectedIndex => _selectedIndex;
  Color get backgroundColor => _backgroundColor;
  Color get activeColor => _activeColor;
  Color get inactiveColor => _inactiveColor;

  set selectedIndex(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }

  set backgroundColor(Color backgroundColor) {
    if (_backgroundColor == backgroundColor) return;
    _backgroundColor = backgroundColor;
    notifyListeners();
  }

  set activeColor(Color activeColor) {
    if (_activeColor == activeColor) return;
    _activeColor = activeColor;
    notifyListeners();
  }

  set inactiveColor(Color inactiveColor) {
    if (_inactiveColor == inactiveColor) return;
    _inactiveColor = inactiveColor;
    notifyListeners();
  }
}

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatefulWidget {
  final bool showMenu;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  const PinterestMenu({
    super.key,
    this.showMenu = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  @override
  State<PinterestMenu> createState() => _PinterestMenuState();
}

class _PinterestMenuState extends State<PinterestMenu> {
  late final _OptionsMenuModel _optionsMenuModel;

  @override
  void initState() {
    super.initState();
    _optionsMenuModel = _OptionsMenuModel();

    _optionsMenuModel.initializeConfig(
      backgroundColor: widget.backgroundColor,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
    );
  }

  @override
  void didUpdateWidget(covariant PinterestMenu oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.backgroundColor != oldWidget.backgroundColor) {
      _optionsMenuModel.backgroundColor = widget.backgroundColor;
    }
    if (widget.activeColor != oldWidget.activeColor) {
      _optionsMenuModel.activeColor = widget.activeColor;
    }
    if (widget.inactiveColor != oldWidget.inactiveColor) {
      _optionsMenuModel.inactiveColor = widget.inactiveColor;
    }
  }

  @override
  void dispose() {
    _optionsMenuModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => _OptionsMenuModel(),
    //   child: AnimatedOpacity(
    //     opacity: widget.showMenu ? 1 : 0,
    //     duration: const Duration(milliseconds: 500),
    //     child: IgnorePointer(
    //       ignoring: !widget.showMenu,
    //       child: Builder(
    //         builder: (BuildContext context) {
    //           Provider.of<_OptionsMenuModel>(context).backgroundColor =
    //               widget.backgroundColor;
    //           Provider.of<_OptionsMenuModel>(context).activeColor =
    //               widget.activeColor;
    //           Provider.of<_OptionsMenuModel>(context).inactiveColor =
    //               widget.inactiveColor;

    //           return _PinterestMenuBackground(
    //             optionsMenuModel: _optionsMenuModel,
    //             child: _MenuItems(
    //               menuItems: widget.items,
    //               optionsMenuModel: _optionsMenuModel,
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
    return AnimatedOpacity(
      opacity: widget.showMenu ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: IgnorePointer(
        ignoring: !widget.showMenu,
        child: Builder(
          builder: (BuildContext context) {
            // Provider.of<_OptionsMenuModel>(context).backgroundColor =
            //     widget.backgroundColor;
            // Provider.of<_OptionsMenuModel>(context).activeColor =
            //     widget.activeColor;
            // Provider.of<_OptionsMenuModel>(context).inactiveColor =
            //     widget.inactiveColor;

            return _PinterestMenuBackground(
              optionsMenuModel: _optionsMenuModel,
              child: _MenuItems(
                menuItems: widget.items,
                optionsMenuModel: _optionsMenuModel,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final _OptionsMenuModel optionsMenuModel;
  final Widget child;
  const _PinterestMenuBackground({
    required this.optionsMenuModel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // final backgroundColorMenu =
    //     Provider.of<_OptionsMenuModel>(context).backgroundColor;
    final backgroundColorMenu = optionsMenuModel.backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        // color: Colors.white,
        color: backgroundColorMenu,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          const BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final _OptionsMenuModel optionsMenuModel;
  final List<PinterestButton> menuItems;
  const _MenuItems({required this.menuItems, required this.optionsMenuModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuButton(
          index: index,
          menuItem: menuItems[index],
          optionsMenuModel: optionsMenuModel,
        ),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton menuItem;
  final _OptionsMenuModel optionsMenuModel;
  const _PinterestMenuButton({
    required this.index,
    required this.menuItem,
    required this.optionsMenuModel,
  });

  @override
  Widget build(BuildContext context) {
    // final itemMenu = Provider.of<_OptionsMenuModel>(context);
    final itemMenu = optionsMenuModel;
    final isItemSelected = itemMenu.selectedIndex == index;

    return IconButton(
      onPressed: () {
        // Provider.of<_OptionsMenuModel>(context, listen: false).selectedIndex =
        //     index;
        itemMenu.selectedIndex = index;
        menuItem.onPressed();
      },
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: isItemSelected ? 35 : 25,
        height: isItemSelected ? 35 : 25,
        child: Icon(
          menuItem.icon,
          size: isItemSelected ? 35 : 25,
          color: isItemSelected ? itemMenu.activeColor : itemMenu.inactiveColor,
        ),
      ),
    );
  }
}
