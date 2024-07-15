import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
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
              'Email ',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: kInputDecoration(
              'Password ',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const PrimaryButton(
            text: 'Login',
            icon: CupertinoIcons.arrow_right,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButtonWidget(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const RegisterScreen();
              }));
            },
            text: "Don't have an account? Register",
          ),
        ],
      ),
    );
  }
}
