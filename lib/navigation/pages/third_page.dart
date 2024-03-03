import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({super.key, required this.name});

  String name;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hi ${widget.name} welcome back, "),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Bye');
              },
              child: const Text('Back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
