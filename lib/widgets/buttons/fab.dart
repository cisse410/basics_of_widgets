import 'package:flutter/material.dart';

class FAB extends StatefulWidget {
  const FAB({super.key});

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(

      onPressed: () {
        setState(() {
          print('FAB clicked');
        });
      },
      elevation: 10,
      backgroundColor: Colors.blue,
      icon: const Icon(Icons.add, color: Colors.white,),
      label: Text('Ajouter', style: TextStyle(color: Colors.white),),
    );
  }
}
