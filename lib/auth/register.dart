// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:johan/auth/email_field.dart';
import 'package:johan/auth/password_field.dart';
import 'package:johan/auth/phone_Field.dart';
import 'package:johan/auth/textfield.dart';
import 'package:johan/navigation/routes/auth_routes.dart';

class Register extends StatefulWidget {
  @override
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final registerKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _registerValidate() {
    var isValidate = false;
    var form = registerKey.currentState;
    if (form != null) {
      isValidate = form.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inscription',
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: registerKey,
            child: Column(
              children: [
                Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/uidt.jpeg'),
                      height: 175,
                      width: 150,
                    ),
                    const Text(
                      "Formulaire d'inscription",
                      style: TextStyle(fontSize: 19),
                    ),
                    FormTextFiled(
                      controller: nameController,
                      hintText: 'Nom complet',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    EmailFormFiled(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    PhoneFormField(
                      controller: phoneController,
                      hintText: 'Téléphone',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    PasswordFormField(
                      controller: passwordController,
                      hintText: 'Mot de paasse',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _registerValidate();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Register'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AuthRouteManager.login);
                          },
                          style: const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(Colors.blue)
                          ),
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
