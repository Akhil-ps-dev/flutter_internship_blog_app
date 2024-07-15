import 'package:flutter/material.dart';

import '../../core/common/blog_card.dart';

class AllBlogScreen extends StatelessWidget {
  const AllBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('All Blogs'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        itemBuilder: (context, index) {
          return BlogCard();
        },
        itemCount: 4,
      ),
    );
  }
}
