import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_blog_app/core/utils/utils.dart';
import 'package:flutter_internship_blog_app/models/my_blogs/my_blogs_ser.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../infrastructure/repository.dart';
import '../../models/delete_blogs/delete_blog_ser.dart';
import '../../models/my_blogs/my_blogs_model.dart';
import '../auth/login/login.dart';

class MyBlogsScreen extends StatefulWidget {
  const MyBlogsScreen({super.key});

  @override
  State<MyBlogsScreen> createState() => _MyBlogsScreenState();
}

class _MyBlogsScreenState extends State<MyBlogsScreen> {
  late MyBlogsViewModle getMyViewModle;
  late DeleteBlogViewModle deleteBlogViewModle;
  @override
  void initState() {
    getMyViewModle = MyBlogsViewModle(repository: context.read<Repository>());
    getMyViewModle.fetchMyBlogs();

    deleteBlogViewModle =
        DeleteBlogViewModle(repository: context.read<Repository>());

    super.initState();
  }

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
      body:
          BlocBuilder<VelocityBloc<MyBlogsModel>, VelocityState<MyBlogsModel>>(
        bloc: getMyViewModle.getMyBlogsBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              itemBuilder: (context, index) {
                final blogs = state.data.data![index];
                return BlogCard2(
                  title: blogs.title!,
                  description: blogs.description!,
                  imageUrl: blogs.image!,
                  onDelete: () {
                    deleteBlogViewModle.deleteBlog(blogs.id!, context);
                  },
                );
              },
              itemCount: state.data.data!.length,
            );
          }
          return const Center(
            child: Text('No Data Found'),
          );
        },
      ),
    );
  }
}

class BlogCard2 extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final VoidCallback onDelete;
  const BlogCard2({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
            const Divider(),
            ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                trailing: IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                )),
          ],
        ),
      ),
    );
  }
}
