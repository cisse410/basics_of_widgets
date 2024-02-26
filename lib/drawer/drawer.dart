import 'package:flutter/material.dart';
import 'package:johan/drawer/drawer_divider.dart';
import 'package:johan/drawer/drawer_items.dart';
import 'package:johan/drawer/drawer_items_tile.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final pages = [
    const Center(
      child: Text('Accueil'),
    ),
    const Center(
      child: Text('Contacts'),
    ),
    const Center(
      child: Text('Favoris'),
    ),
    const Center(
      child: Text('Messages'),
    ),
    const Center(
      child: Text('Corbeille'),
    ),
    const Center(
      child: Text('Paramètres'),
    ),
  ];

  VoidCallback changePage(int index) {
    return () {
      setState(() {
        indexClick = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drawer navigation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: pages[indexClick],
      drawer: Drawer(
        width: 275,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/drawer.jpg'),
                    fit: BoxFit.fill),
              ),
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: const Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Moustapha DRAME',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'amdy95@gmail.com',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  DrawerItemsTile(
                    index: 0,
                    onTap: changePage(0),
                  ),
                  DrawerItemsTile(
                    index: 1,
                    onTap: changePage(1),
                  ),
                  DrawerItemsTile(
                    index: 2,
                    onTap: changePage(2),
                  ),
                  DrawerItemsTile(
                    index: 3,
                    onTap: changePage(3),
                  ),
                  DrawerItemsTile(
                    index: 4,
                    onTap: changePage(4),
                  ),
                  DrawerItemsTile(
                    index: 5,
                    onTap: changePage(5),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DrawerDivider(),
                  Center(
                    child: Text(
                      '#L2F',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: DrawerItems.drawerItemSelectedColor
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Center(
                    child: Text(
                      '#CISSE410',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: DrawerItems.drawerItemColor
                      ),
                    ),
                  ),
                  const DrawerDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
