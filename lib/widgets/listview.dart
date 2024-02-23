import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var widgets = [
      ListTile(
        leading: const Text(
          'M',
          style: TextStyle(
            fontSize: 50
          ),
        ),
        title: const Text(
          'Mouhamedoune FALL',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'Développeur Full Stack',
        ),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline, color: Colors.teal,)),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List View',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: widgets.length,
              itemBuilder: (context, index) {
                return widgets[index];
              },
            ),
          ),
          const Text(
            'End of the container',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
