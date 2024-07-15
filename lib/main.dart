import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_blog_app/infrastructure/repository.dart';
import 'package:flutter_internship_blog_app/screens/splash_screen/splash_screen.dart';

import 'infrastructure/auth/login_rego.dart';
import 'infrastructure/auth/register_repo.dart';
import 'infrastructure/create_blogs/create_blogs_repo.dart';
import 'infrastructure/get_all_blogs/get_all_blogs_repo.dart';
import 'infrastructure/my_blogs/my_blogs_repo.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => Repository(
        loginRepo: LoginRepo(),
        registerRepo: RegisterRepo(),
        getAllBlogsRepo: GetAllBlogsRepo(),
        createBlogRepo: CreateBlogsRepo(),
        myBlogsRepo: MyBlogsRepo(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}


// ctrl x cut code 
// ctrl v paste code
// ctrl s save code
// ctrl z undo code
// ctrl y redo code
// ctrl c copy code 