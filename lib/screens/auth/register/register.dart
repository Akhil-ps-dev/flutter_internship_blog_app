import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../login/login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 32,
        ),
        children: [
          TextFormField(
            decoration: kInputDecoration(
              'Full Name',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField<String>(
            onChanged: (value) {
              print(value);
            },
            items: [
              'Male',
              'Female',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: kInputDecoration('Select Gender'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: kInputDecoration(
              'Email',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: kInputDecoration(
              'Image URL',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: kInputDecoration(
              'Password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
           PrimaryButton(
            text: 'Register',
            icon: Icons.person_add,
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          TextButtonWidget(
            text: 'Already have an account? Login',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
