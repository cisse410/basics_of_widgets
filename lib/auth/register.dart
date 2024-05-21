// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:johan/auth/email_field.dart';
import 'package:johan/auth/password_field.dart';
import 'package:johan/auth/textfield.dart';
import 'package:johan/navigation/routes/auth_routes.dart';

import '../widgets/default_app_bar.dart';

class Register extends StatefulWidget {
  @override
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DateTime selectedDate = DateTime.now();

    String content = "Date";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        helpText: 'Votre date de naissance'
      );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        content = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  

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
      appBar: DefaultAppBar(
        title: "Inscription".toUpperCase(),
        backgroundColor: Colors.purple,
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
                      image: AssetImage('assets/images/login.png'),
                      height: 230,
                      width: 230,
                    ),
                    const Text(
                      "Formulaire d'inscription",
                      style: TextStyle(fontSize: 19),
                    ),
                    FormTextFiled(
                      controller: nameController,
                      hintText: 'Nom complet',
                      keyboardType: TextInputType.datetime,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IntlPhoneField(
                        searchText: 'Rechercher un pays',
                        decoration: InputDecoration(
                          hintText: 'Téléphone',
                          filled: true,
                          fillColor: Colors.blue[100],
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        invalidNumberMessage: "Saisir un numéro correct",
                        initialCountryCode: 'SN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                    // PhoneFormField(
                    //   controller: phoneController,
                    //   hintText: 'Téléphone',
                    //   keyboardType: TextInputType.phone,
                    // ),
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
                    ElevatedButton.icon(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue
                        ),
                        icon: const Icon(Icons.calendar_month),
                        label: Text(content)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                        ),
                        InkWell(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AuthRouteManager.login);
                            },
                            style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            child: const Text(
                              'Se connecter',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
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
