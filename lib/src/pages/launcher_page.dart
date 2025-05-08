import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  'HEYA',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            const Expanded(child: _OptionsList()),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: const Text('Dark mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.blue,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen, color: Colors.blue),
              title: const Text('Custom theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: Colors.blue,
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
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: Colors.blue),
      itemCount: pageRoutes.length,
      itemBuilder:
          (context, index) => ListTile(
            leading: FaIcon(pageRoutes[index].icon, color: Colors.blue),
            title: Text(pageRoutes[index].title),
            trailing: const Icon(Icons.chevron_right, color: Colors.blue),
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
