import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/routes/routes.dart';
import '/src/theme/theme_changer.dart';
import '/src/models/layout_model.dart';
// import '/src/pages/pages.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context);
    final layoutModel = LayoutModelNotifier.watch(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.currentTheme.colorScheme.primary,
        // Because in custom theme, the color was black in light mode
        title: const Text(
          'Designs - Tablet',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: _PrincipalMenu(),
      // body: const _OptionsList(),
      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            color: appTheme.currentTheme.colorScheme.onPrimary,
            child: const _OptionsList(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color:
                (appTheme.darkTheme)
                    ? Colors.grey
                    : appTheme.currentTheme.colorScheme.primary,
          ),

          // const Expanded(child: SlideShowPage()),
          Expanded(child: layoutModel.currentPage),
        ],
      ),
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context);
    final primaryColor = appTheme.currentTheme.colorScheme.primary;

    return Drawer(
      backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: primaryColor,
                child: const Text(
                  'HEYA',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            const Expanded(child: _OptionsList()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: primaryColor),
              title: Text(
                'Dark mode',
                style: TextStyle(
                  color: appTheme.currentTheme.colorScheme.secondary,
                ),
              ),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: primaryColor,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: primaryColor),
              title: Text(
                'Custom theme',
                style: TextStyle(
                  color: appTheme.currentTheme.colorScheme.secondary,
                ),
              ),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: primaryColor,
                onChanged: (value) => appTheme.customTheme = value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context).currentTheme;
    // final layoutModel = LayoutModelNotifier.watch(context);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder:
          (context, index) => Divider(
            color: appTheme.colorScheme.primary, // primaryColorLight
          ),
      itemCount: pageRoutes.length,
      itemBuilder:
          (context, index) => ListTile(
            leading: FaIcon(
              pageRoutes[index].icon,
              color: appTheme.colorScheme.primary,
            ),
            title: Text(
              pageRoutes[index].title,
              style: TextStyle(color: appTheme.colorScheme.secondary),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: appTheme.colorScheme.primary,
            ),
            onTap: () {
              final layoutModel = LayoutModelNotifier.read(context);
              layoutModel.currentPage = pageRoutes[index].page;

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => pageRoutes[index].page),
              // );
            },
          ),
    );
  }
}
