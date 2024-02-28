import 'package:flutter/material.dart';
import 'package:johan/widgets/buttons/elevated_button.dart';
import 'package:johan/widgets/buttons/fab.dart';
import 'package:johan/widgets/buttons/text_button.dart';

class AppBarItem extends StatefulWidget {
  const AppBarItem({super.key});

  @override
  State<AppBarItem> createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem> {
  String text = 'Nothing';
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  Icon notificationIcon = const Icon(Icons.notifications_none_sharp);
  bool notificationIsActive = false;

  void notifyMe() {
    setState(() {
      if (notificationIsActive) {
        notificationIcon = const Icon(Icons.notifications_none);
        notificationIsActive = false;
      } else {
        notificationIcon = const Icon(Icons.notifications_on_outlined);
        notificationIsActive = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
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
            onPressed: notifyMe,
            icon: notificationIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: const FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(text),
          ),
          elevatedBtn(),
          txtButton(),
        ],
      ),
    );
  }
}
