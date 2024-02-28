import 'package:flutter/material.dart';
import 'package:johan/widgets/buttons/fab.dart';

class AppBarItem extends StatefulWidget {
  const AppBarItem({super.key});

  @override
  State<AppBarItem> createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem> {
  String text = 'Nothing';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  final snackBar = SnackBar(
    content: const Text('Content of the snack bar'),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Fermer',
      onPressed: () {},
      textColor: Colors.white,
    ),
  );

  Future showAlertDelete() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(width: 2, color: Colors.green)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Non'),
              ),
              TextButton(
                onPressed: () {
                  print('Supprimer avec succes');
                  Navigator.pop(context);
                },
                child: const Text('Oui'),
              ),
            ],
            title: const Text('Suppression'),
            content: const Text('Etes vous sur de vouloir supprimer?'),
          );
        });
  }

  String country = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'App Bar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade400,
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
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Click here'),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              onPressed: showAlertDelete,
              child: const Text('Supprimer')),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            onPressed: () async {
              final String countr = await showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Choose your country'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Thies');
                          },
                          child: const Text('Thies'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Dakar');
                          },
                          child: const Text('Dakar'),
                        )
                      ],
                    );
                  });
              setState(() {
                country = countr;
              });
            },
            child: Text('Country?'.toUpperCase()),
          ),
          Text(country),
          const SizedBox(
            height: 5.0,
          ),
          ElevatedButton.icon(
              onPressed: () {
                scaffoldKey.currentState?.showBottomSheet((context) {
                  return Container(
                    height: 160,
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        )),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Partager avec email',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.bluetooth,
                                color: Colors.white),
                            label: const Text(
                              'Partager avec bluetooth',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.wifi, color: Colors.white),
                            label: const Text(
                              'Partage a proximite',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              icon: const Icon(Icons.share_rounded),
              label: const Text('Partager l\'application')),
        ],
      ),
    );
  }
}
