import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import '../../constants.dart';
import '../../infrastructure/repository.dart';
import '../../models/get_blog_byid/get_blog_byid_services.dart';
import '../../models/update_blog/update_services.dart';

class EditBlogPage extends StatefulWidget {
  final String blogId;
  final String title;
  final String description;
  final String image;

  const EditBlogPage({
    super.key,
    required this.blogId,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  _EditBlogPageState createState() => _EditBlogPageState();
}

class _EditBlogPageState extends State<EditBlogPage> {
  late UpdateBlogViewModel updateBlogViewModel;
  late GetBlogsByIdViewModel getBlogsByIdViewModel;

  final TextEditingController imageNameController = TextEditingController();
  XFile? _selectedImage;

  @override
  void initState() {
    getBlogsByIdViewModel =
        GetBlogsByIdViewModel(repository: context.read<Repository>());
    updateBlogViewModel =
        UpdateBlogViewModel(repository: context.read<Repository>());

    // Pre-fill the controllers with existing data
    updateBlogViewModel.titleController.text = widget.title;
    updateBlogViewModel.descriptionController.text = widget.description;
    imageNameController.text = widget.image;

    super.initState();
  }

  void _clearFields() {
    updateBlogViewModel.titleController.clear();
    updateBlogViewModel.descriptionController.clear();
    imageNameController.clear();
    setState(() {
      _selectedImage = null;
    });
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
        title: const Text('Edit Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: updateBlogViewModel.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: updateBlogViewModel.titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateBlogViewModel.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
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
                  : widget.image.isNotEmpty
                      ? Column(
                          children: [
                            Image.network(
                              widget.image,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.image,
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
                bloc: updateBlogViewModel.isLoadingBloc,
                builder: (context, state) {
                  return state.data
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                child: PrimaryButton(
                                  text: 'Update Blog',
                                  icon: Icons.create,
                                  onPressed: () {
                                    updateBlogViewModel.updateBlog(
                                      widget.blogId,
                                      _selectedImage!.path,
                                      context,
                                    );
                                  },
                                )),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: _clearFields,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Text('Clear all fields'),
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    updateBlogViewModel.titleController.dispose();
    updateBlogViewModel.descriptionController.dispose();
    imageNameController.dispose();
    super.dispose();
  }
}
