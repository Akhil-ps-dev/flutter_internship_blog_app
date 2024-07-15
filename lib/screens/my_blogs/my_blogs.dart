import 'package:flutter/material.dart';
import 'package:flutter_internship_blog_app/core/utils/utils.dart';
import 'package:flutter_internship_blog_app/screens/auth/login/login.dart';

class MyBlogsScreen extends StatelessWidget {
  const MyBlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Blogs'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Utils().logOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }),
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: const Center(
        child: Text('My Blogs'),
      ),
    );
  }
}
