import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/src/routes/routes.dart';
import '/src/theme/theme_changer.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Designs')),
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

    return Drawer(
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
              title: const Text('Dark mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: primaryColor,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: primaryColor),
              title: const Text('Custom theme'),
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
            title: Text(pageRoutes[index].title),
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
