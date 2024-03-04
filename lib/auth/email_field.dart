import 'package:flutter/material.dart';

class EmailFormFiled extends StatelessWidget {
  const EmailFormFiled({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.blue.shade100,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(
            Icons.email_rounded,
            color: Colors.blue,
            size: 24,
          ),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ce champs est obligatoire.";
          }
          return null;
        },
      ),
    );
  }
}
