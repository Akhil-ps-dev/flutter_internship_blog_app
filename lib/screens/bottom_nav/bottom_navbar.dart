import 'package:flutter/material.dart';

import '../all_blogs/all_blog.dart';
import '../create_blogs/create_blog.dart';
import '../my_blogs/my_blogs.dart';
import 'widgets/bottom_nav_widget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  final _pages = const [
    AllBlogScreen(),
    CreateBlogScreen(),
    MyBlogsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, value, child) {
          return _pages[value];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
