import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:blog_app/widgets/container/category_container.dart';
import 'package:blog_app/widgets/formfiled/custom_form_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BlogCreateScreen extends StatefulWidget {
  const BlogCreateScreen({super.key});

  @override
  State<BlogCreateScreen> createState() => _BlogCreateScreenState();
}

class _BlogCreateScreenState extends State<BlogCreateScreen> {
  File? _pickedImage;
  final formKey = GlobalKey<FormState>();

  BlogCategory? _selectedCategory;
  var author = '';
  var title = '';
  var content = '';

  void _pickImageFrom() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? imgFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 200,
        maxWidth: 200,
        imageQuality: 100);
    if (imgFile == null) {
      return;
    }
    setState(() {
      _pickedImage = File(imgFile.path);
    });
  }

  void _createBlog() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (author.isEmpty ||
          title.isEmpty ||
          content.isEmpty ||
          _pickedImage == null) {
        return;
      }

      final blog = Blog(_selectedCategory!, _pickedImage!.path, author, [],
          title: title, content: content, createdAt: DateTime.now());

      context.read<BlogProvider>().addBlog(blog);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Blog has been created successfully!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelMedium;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bring Your Creativity'),
        backgroundColor: AppColor.appBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What will you be doing about ?',
                    style: labelStyle,
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 140,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 50,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory = BlogCategory.values[index];
                            });
                          },
                          child: CategoryContainer(
                              isActive: _selectedCategory ==
                                  BlogCategory.values[index],
                              category: BlogCategory.values[index]),
                        );
                      },
                    ),
                  ),
                  CustomFormTextField(
                    label: 'First, Introduce your name',
                    onSaved: (val) {
                      if (val == null) {
                        return;
                      }
                      setState(() {
                        author = val;
                      });
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Username is nont-empty field';
                      }
                      return null;
                    },
                    maxLength: 15,
                  ),
                  CustomFormTextField(
                    label: 'What willl be your blog called ?',
                    maxLength: 30,
                    onSaved: (val) {
                      if (val == null) {
                        return;
                      }
                      setState(() {
                        title = val;
                      });
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Title is nont-empty field';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  CustomFormTextField(
                    label: 'Explain to the world! ',
                    maxLines: 10,
                    onSaved: (val) {
                      if (val == null) {
                        return;
                      }
                      setState(() {
                        content = val;
                      });
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'You are required to write something......';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  Text(
                    'Add Image',
                    style: labelStyle,
                  ),
                  const Gap(10),
                  Align(
                    alignment: Alignment.center,
                    child: DottedBorder(
                      radius: const Radius.circular(20),
                      padding: const EdgeInsets.all(20),
                      borderType: BorderType.RRect,
                      dashPattern: const [10, 10],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: GestureDetector(
                        onTap: _pickImageFrom,
                        child: Container(
                            height: 200,
                            clipBehavior: Clip.hardEdge,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: _pickedImage == null
                                ? Image.asset(
                                    "assets/images/add/add_image.png",
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    _pickedImage!,
                                    fit: BoxFit.cover,
                                  )),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: _createBlog,
                        child: const Text('Create'),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
