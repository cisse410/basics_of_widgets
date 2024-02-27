import 'package:flutter/material.dart';
import 'package:johan/drawer/drawer.dart';

class AppBarItem extends StatefulWidget {
  const AppBarItem({super.key});

  @override
  State<AppBarItem> createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem> {
  @override
  Widget build(BuildContext context) {
    String text = 'Nothing';
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _drawerKey,
        drawer: const DrawerNavigation(),
        appBar: AppBar(
          title: const Text(
            'App Bar',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade400,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_sharp),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
            ),
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                );
              }
            ),
          ],
        ),
        drawerEnableOpenDragGesture: false,
        body: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
