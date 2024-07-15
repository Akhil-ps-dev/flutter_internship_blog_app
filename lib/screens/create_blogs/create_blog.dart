import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_blog_app/constants.dart';
import 'package:flutter_internship_blog_app/models/cretate_blog_model/create_blog_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../infrastructure/repository.dart';

class CreateBlogScreen extends StatefulWidget {
  @override
  _CreateBlogScreenState createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  late CreateBlogViewModel createBlogViewModel;

  final TextEditingController imageNameController = TextEditingController();
  XFile? _selectedImage;

  @override
  void initState() {
    createBlogViewModel =
        CreateBlogViewModel(repository: context.read<Repository>());
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _selectedImage = image;
        imageNameController.text = image.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Create Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: createBlogViewModel.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: createBlogViewModel.titleContoller,
                decoration: kInputDecoration(
                  'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: createBlogViewModel.descriptionContoller,
                decoration: kInputDecoration('Description'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: imageNameController,
                decoration: InputDecoration(
                  labelText: 'Image File Name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an image';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _selectedImage != null
                  ? Column(
                      children: [
                        Image.file(
                          File(_selectedImage!.path),
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          imageNameController.text,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(height: 16.0),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: createBlogViewModel.isLoadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                      text: 'Create Blog',
                      icon: Icons.create,
                      onPressed: () {
                        if (createBlogViewModel.formKey.currentState!
                            .validate()) {
                          createBlogViewModel.createBlog(
                              _selectedImage!.path, context);
                        }
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    imageNameController.dispose();
    super.dispose();
  }
}
