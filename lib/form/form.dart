import 'package:flutter/material.dart';
import 'package:johan/form/textfield.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  Future showConfirmMessage() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.warning_amber,
              size: 50,
              color: Colors.amber,
            ),
            title: const Text(
              'Confirmation',
            ),
            content: const Text('Etes vous sur de bien saisi les informations? '),
            actions: [
              TextButton(onPressed: (){}, child: const Text('Non', style: TextStyle(color: Colors.red),)),
              TextButton(onPressed: (){}, child: const Text('Oui', style: TextStyle(color: Colors.green),)),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: 20,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormTextField(
                  controller: prenomController,
                  hint: 'Prenom',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormTextField(
                  controller: nomController,
                  hint: 'Nom',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormTextField(
                  controller: phoneNumberController,
                  hint: 'Telephone',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormTextField(
                  controller: emailAddressController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: showConfirmMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.save),
                  label: const Text('Enregistrer')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
