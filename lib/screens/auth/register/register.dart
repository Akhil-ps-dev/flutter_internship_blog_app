import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../infrastructure/repository.dart';
import '../../../models/register/register_services.dart';
import '../login/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterViewModel registerViewModel;
  @override
  void initState() {
    registerViewModel =
        RegisterViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String selectGender = 'Male';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: registerViewModel.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 32,
          ),
          children: [
            TextFormField(
              controller: registerViewModel.nameController,
              decoration: kInputDecoration(
                'Full Name',
              ),
              validator: (val) => val!.isEmpty ? 'Invalid name' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<String>(
              value: selectGender,
              onChanged: (value) {
                selectGender = value!;
                registerViewModel.setGender(selectGender);
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
              controller: registerViewModel.emailController,
              decoration: kInputDecoration(
                'Email',
              ),
              validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: registerViewModel.profilePicture,
              decoration: kInputDecoration(
                'Image URL',
              ),
              validator: (val) => val!.isEmpty ? 'Invalid Image' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: registerViewModel.passwordController,
              decoration: kInputDecoration(
                'Password',
              ),
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              text: 'Register',
              icon: Icons.person_add,
              onPressed: () {
                if (registerViewModel.formKey.currentState!.validate()) {
                  registerViewModel.login(context);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButtonWidget(
              text: 'Already have an account? Login',
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
