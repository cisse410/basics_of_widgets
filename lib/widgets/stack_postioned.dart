import 'package:flutter/material.dart';

class StackPositionedWidget extends StatelessWidget {
  const StackPositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stack Positioned',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
          ),
          const Positioned(
            top: 200,
            left: 70,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
