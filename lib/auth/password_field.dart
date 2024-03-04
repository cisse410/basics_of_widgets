import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscurTextPassword = false;
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.blue.shade100,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(
            Icons.lock_rounded,
            color: Colors.blue,
            size: 24,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: IconButton(
              icon: _obscurTextPassword
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off, size: 24,),
              onPressed: () {
                setState(() {
                  _obscurTextPassword = !_obscurTextPassword;
                });
              },
            ),
          ),
        ),
        obscureText: _obscurTextPassword,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        keyboardType: widget.keyboardType,
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
