import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/models/user.dart';
import 'package:blog_app/providers/authentication_provider.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:blog_app/widgets/snackbar/error/flasherro.dart';
import 'package:blog_app/widgets/snackbar/sucess_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  var isSignUp = false;

  var email = '';
  var psw = '';
  var userName = '';
  var hidePsw = true;
  File? _pickedImage;

  final formKey = GlobalKey<FormState>();

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? imgFile =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 50);
    if (imgFile == null) {
      return;
    }
    setState(() {
      _pickedImage = File(imgFile.path);
    });
  }

  void _onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final provider = context.read<AuthenticationProvider>();

      // for signup
      if (isSignUp) {
        if (psw.isEmpty || userName.isEmpty || email.isEmpty) {
          return;
        }
        final user = User(
          name: userName,
          email: email,
          password: psw,
          profileImg: _pickedImage == null
              ? "assets/images/add/user_image.png"
              : _pickedImage!.path,
        );
        final msg = provider.registerUser(user);
        if (msg.trim().isNotEmpty) {
          showFlashError(context, msg);
          return;
        }

        showSuccessSnackbar(
            context, 'Successfuly created your acccount!, Proceed to login');
      }
      // for login

      if (!isSignUp) {
        final user = provider.authenticateUser(email, psw);
        if (user != null && user.authenticatedState) {
          context.router.pushAndPopUntil(MainRoute(user: user),
              predicate: (route) => false);
        } else {
          showFlashError(context, 'Invalid Credentials!');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(children: [
          // --- form -----
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isSignUp ? 'SIGN UP' : 'LOGIN',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      isSignUp
                          ? 'Register Yourself'
                          : 'Please signin to continue !',
                    ),
                    const Gap(20),
                    if (isSignUp)
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: _pickedImage != null
                                  ? FileImage(_pickedImage!) as ImageProvider
                                  : const AssetImage(
                                      "assets/images/add/user_image.png"),
                            ),
                            TextButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(Icons.camera),
                              label: const Text('Add Image'),
                            ),
                          ],
                        ),
                      ),
                    if (isSignUp) const Gap(20),
                    if (isSignUp)
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'User Name',
                            prefixIcon: const Icon(Iconsax.profile_2user),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide name';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          userName = newValue!;
                        },
                      ),
                    if (isSignUp) const Gap(20),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (value) {
                        if (!(value!.contains('@'))) {
                          return 'Email is Invalid';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        email = newValue!;
                      },
                    ),
                    const Gap(30),
                    TextFormField(
                      obscureText: hidePsw,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password_outlined),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                hidePsw = !hidePsw;
                              });
                            },
                            child: Icon(
                                hidePsw ? Iconsax.eye_slash : Iconsax.eye)),
                      ),
                      validator: (value) {
                        if ((value!.isEmpty || value.trim().length < 9)) {
                          return 'password  must be at least 9 characters';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        psw = newValue!;
                      },
                    ),
                    const Gap(10),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            onPressed: _onSubmit,
                            child: Text(isSignUp ? 'SIGN UP' : 'LOGIN')))
                  ],
                ),
              ),
            ),
          ),
          // ------ [signin/up text] / button
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isSignUp
                      ? 'Already have an account !'
                      : 'Don\'t have account ?'),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isSignUp = !isSignUp;
                          formKey.currentState!.reset();
                        });
                      },
                      child: Text(isSignUp ? 'Login' : 'Sign Up')),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
