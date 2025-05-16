import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

import '/src/routes/routes.dart';
// import '/src/theme/theme_changer.dart';
import '/src/theme/theme_changer2.dart';

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
    // final appTheme = Provider.of<ThemeChanger>(context);
    // final primaryColor =
    //     appTheme.currentTheme.colorScheme.primary; //inversePrimary;

    final appTheme2 = ThemeChanger2Notifier.watch(context);
    final primaryColor2 = appTheme2.currentTheme.colorScheme.primary;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                // backgroundColor: primaryColor,
                backgroundColor: primaryColor2,
                child: const Text(
                  'HEYA',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            const Expanded(child: _OptionsList()),
            ListTile(
              // leading: Icon(Icons.lightbulb_outline, color: primaryColor),
              leading: Icon(Icons.lightbulb_outline, color: primaryColor2),
              title: const Text('Dark mode'),
              trailing: Switch.adaptive(
                // value: appTheme.darkTheme,
                // activeColor: primaryColor,
                // onChanged: (value) => appTheme.darkTheme = value,
                value: appTheme2.darkTheme,
                activeColor: primaryColor2,
                onChanged: (value) => appTheme2.darkTheme = value,
              ),
            ),
            ListTile(
              // leading: Icon(Icons.add_to_home_screen, color: primaryColor),
              leading: Icon(Icons.add_to_home_screen, color: primaryColor2),
              title: const Text('Custom theme'),
              trailing: Switch.adaptive(
                // value: appTheme.customTheme,
                // activeColor: primaryColor,
                // onChanged: (value) => appTheme.customTheme = value,
                value: appTheme2.customTheme,
                activeColor: primaryColor2,
                onChanged: (value) => appTheme2.customTheme = value,
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
    // final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final appTheme2 = ThemeChanger2Notifier.watch(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder:
          (context, index) => Divider(
            // color: appTheme.colorScheme.primary, // primaryColorLight
            color: appTheme2.colorScheme.primary,
          ),
      itemCount: pageRoutes.length,
      itemBuilder:
          (context, index) => ListTile(
            leading: FaIcon(
              pageRoutes[index].icon,
              // color: appTheme.colorScheme.primary,
              color: appTheme2.colorScheme.primary,
            ),
            title: Text(pageRoutes[index].title),
            trailing: Icon(
              Icons.chevron_right,
              // color: appTheme.colorScheme.primary,
              color: appTheme2.colorScheme.primary,
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
