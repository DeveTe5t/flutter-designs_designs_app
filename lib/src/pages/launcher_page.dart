import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/routes/routes.dart';
import '/src/theme/theme_changer.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.currentTheme.colorScheme.primary,
        // Because in custom theme, the color was black in light mode
        title: const Text('Designs', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: _PrincipalMenu(),
      body: const _OptionsList(),
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeChangerNotifier.watch(context);
    final primaryColor = appTheme.currentTheme.colorScheme.primary;

    return SafeArea(
      child: Drawer(
        backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pageRoutes[index].page),
              );
            },
          ),
    );
  }
}
