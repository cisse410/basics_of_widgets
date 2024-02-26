import 'package:flutter/material.dart';
import 'package:johan/bottom-navbar/bottom_navbar_items.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var indexClick = 0;
  final pages = [
    const Center(
      child: Text('Accueil'),
    ),
    const Center(
      child: Text('Contacts'),
    ),
    const Center(
      child: Text('Messages'),
    ),
    const Center(
      child: Text('Favoris'),
    ),
    const Center(
      child: Text('Corbeille'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bottom Navigation',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: pages[indexClick],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade100,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: BottomNavItems.bottomNavItemSelectedColor,
        unselectedItemColor: BottomNavItems.bottomNavItemColor,
        currentIndex: indexClick,
        onTap: (value) {
          setState(() {
            indexClick = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(BottomNavItems.bottomNavItemIcon[0]),
            label: BottomNavItems.bottomNavItemText[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(BottomNavItems.bottomNavItemIcon[1]),
            label: BottomNavItems.bottomNavItemText[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(BottomNavItems.bottomNavItemIcon[2]),
            label: BottomNavItems.bottomNavItemText[2],
          ),
          BottomNavigationBarItem(
            icon: Icon(BottomNavItems.bottomNavItemIcon[3]),
            label: BottomNavItems.bottomNavItemText[3],
          ),
          BottomNavigationBarItem(
            icon: Icon(BottomNavItems.bottomNavItemIcon[4]),
            label: BottomNavItems.bottomNavItemText[4],
          ),
        ],
      ),
    );
  }
}
