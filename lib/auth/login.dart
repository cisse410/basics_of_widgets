// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:johan/auth/password_field.dart';
import 'package:johan/auth/textfield.dart';
import 'package:johan/navigation/routes/auth_routes.dart';

class Login extends StatefulWidget {
  @override
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submit() {
    var isValid = false;
    var form = _loginFormKey.currentState;
    if (form != null) {
      isValid = form.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Connexion',
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
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
            key: _loginFormKey,
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
                      'Formulaire de connexion',
                      style: TextStyle(fontSize: 19),
                    ),
                    FormTextFiled(
                      controller: usernameController,
                      hintText: 'Username',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PasswordFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                      ),
                      child: const Text('Login')
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AuthRouteManager.register);
                          },
                          style: const ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(Colors.blue)
                          ),
                          child: const Text(
                            "S'inscrire",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
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
