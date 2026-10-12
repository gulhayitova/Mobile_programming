import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
  static const messages = '/messages';
  static const about = '/about';
}

void main() {
  runApp(MaterialApp(
    initialRoute: AppRoutes.home,
    routes: {
      AppRoutes.home: (context) => const SectionScreen(title: 'Home'),
      AppRoutes.profile: (context) => const SectionScreen(title: 'Profile'),
      AppRoutes.messages: (context) => const SectionScreen(title: 'Messages'),
      AppRoutes.about: (context) => const SectionScreen(title: 'About'),
    },
  ));
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _item(BuildContext context, IconData icon, String label, String route) {
    final current = ModalRoute.of(context)?.settings.name;
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: current == route,
      onTap: () {
        Navigator.pop(context); // close the drawer first
        if (current != route) {
          // Replace, so the stack does not grow when switching sections.
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu', style: TextStyle(fontSize: 24)),
          ),
          _item(context, Icons.home, 'Home', AppRoutes.home),
          _item(context, Icons.person, 'Profile', AppRoutes.profile),
          _item(context, Icons.message, 'Messages', AppRoutes.messages),
          _item(context, Icons.info, 'About', AppRoutes.about),
        ],
      ),
    );
  }
}

class SectionScreen extends StatelessWidget {
  final String title;
  const SectionScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const AppDrawer(),
      body: Center(child: Text('$title section', style: const TextStyle(fontSize: 24))),
    );
  }
}