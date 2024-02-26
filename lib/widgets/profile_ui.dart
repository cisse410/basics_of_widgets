import 'package:flutter/material.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Profile UI',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: const Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
