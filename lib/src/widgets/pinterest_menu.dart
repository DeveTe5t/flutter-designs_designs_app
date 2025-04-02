import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  // final Function onPressed;
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
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
  ];

  PinterestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: _PinterestMenuBackground(child: _MenuItems(menuItems: items)),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            // color: Colors.black38.withValues(alpha: 0.3),
            color: Colors.black38,
            // offset: const Offset(0, 0),
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
  final List<PinterestButton> menuItems;
  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuButton(index, menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton menuItem;
  const _PinterestMenuButton(this.index, this.menuItem);

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<_MenuModel>(context).selectedIndex;
    final isSelectedItem = selectedItem == index;

    // way 1
    return IconButton(
      // onPressed: () => menuItem.onPressed(),
      onPressed: () {
        Provider.of<_MenuModel>(context, listen: false).selectedIndex = index;
        menuItem.onPressed();
      },
      icon: Icon(
        menuItem.icon,
        size: isSelectedItem ? 35 : 25,
        color: isSelectedItem ? Colors.black : Colors.blueGrey,
      ),
    );

    // way 2
    // return GestureDetector(
    //   onTap: () {
    //     // important listen: false indoor method
    //     Provider.of<_MenuModel>(context, listen: false).selectedIndex = index;
    //     menuItem.onPressed();
    //   },
    //   // for some old devices
    //   behavior: HitTestBehavior.translucent,
    //   child: SizedBox(
    //     child: Icon(
    //       menuItem.icon,
    //       size: isSelectedItem ? 35 : 25,
    //       color: isSelectedItem ? Colors.black : Colors.blueGrey,
    //     ),
    //   ),
    // );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
