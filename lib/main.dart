import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_blog_app/infrastructure/repository.dart';

import 'infrastructure/auth/login_rego.dart';
import 'screens/auth/register/register.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => Repository(loginRepo: LoginRepo()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegisterScreen(),
    );
  }
}


// ctrl x cut code 
// ctrl v paste code
// ctrl s save code
// ctrl z undo code
// ctrl y redo code
// ctrl c copy code 