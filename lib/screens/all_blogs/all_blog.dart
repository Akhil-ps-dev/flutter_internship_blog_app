import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_blog_app/infrastructure/repository.dart';
import 'package:flutter_internship_blog_app/models/get_all_blogs/get_all_blogs_services.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../core/common/blog_card.dart';
import '../../models/get_all_blogs/get_all_blogs_modeld.dart';

class AllBlogScreen extends StatefulWidget {
  const AllBlogScreen({super.key});

  @override
  State<AllBlogScreen> createState() => _AllBlogScreenState();
}

class _AllBlogScreenState extends State<AllBlogScreen> {
  late GetAllBlogsViewModle getAllBlogsViewModle;
  @override
  void initState() {
    getAllBlogsViewModle =
        GetAllBlogsViewModle(repository: context.read<Repository>());
    getAllBlogsViewModle.fetchAllBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('All Blogs'),
        centerTitle: true,
      ),
      body: BlocBuilder<VelocityBloc<GetAllBlogsModel>,
          VelocityState<GetAllBlogsModel>>(
        bloc: getAllBlogsViewModle.getAllBlogsBloc,
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
                return BlogCard(
                  authorName: blogs.user!.name!,
                  title: blogs.title!,
                  description: blogs.description!,
                  imageUrl: blogs.image!,
                  profilePic: blogs.user!.profilePicture.toString(),
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
