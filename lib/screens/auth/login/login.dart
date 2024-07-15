import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_blog_app/infrastructure/repository.dart';
import 'package:flutter_internship_blog_app/models/auth/login_services.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../../constants.dart';
import '../../bottom_nav/bottom_navbar.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginViewModel loginViewModel;
  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
    super.initState();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: loginViewModel.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 32,
          ),
          children: [
            TextFormField(
              controller: loginViewModel.emailController,
              decoration: kInputDecoration(
                'Email ',
              ),
              validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: loginViewModel.passwordController,
              decoration: kInputDecoration(
                'Password ',
              ),
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: loginViewModel.isLoadingBloc,
              builder: (context, state) {
                return PrimaryButton(
                  text: 'Login',
                  icon: CupertinoIcons.arrow_right,
                  onPressed: () {
                    if (loginViewModel.formKey.currentState!.validate()) {
                      loginViewModel.login(context);
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButtonWidget(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const RegisterScreen();
                }));
              },
              text: "Don't have an account? Register",
            ),
          ],
        ),
      ),
    );
  }
}
