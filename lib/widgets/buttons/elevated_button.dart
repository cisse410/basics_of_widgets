import 'package:flutter/material.dart';

Widget elevatedBtn (){
  return ElevatedButton(
    onPressed: (){},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.save),
        Padding(padding: EdgeInsets.all(6)),
        Text('Enregistrer'),
      ],
    )
  );
}