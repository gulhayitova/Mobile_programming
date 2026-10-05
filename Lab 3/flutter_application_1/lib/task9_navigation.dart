import 'package:flutter/material.dart';

// Exercise 9.1: 3 tabs with BottomNavigationBar
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 9.1: Bottom Navigation')),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Exercise 9.2: top tabs with TabBar and TabBarView
class TopTabsScreen extends StatelessWidget {
  const TopTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task 9.2: Top Tabs'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chats'),
              Tab(icon: Icon(Icons.call), text: 'Calls'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Chats Tab', style: TextStyle(fontSize: 24))),
            Center(child: Text('Calls Tab', style: TextStyle(fontSize: 24))),
            Center(child: Text('Settings Tab', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}