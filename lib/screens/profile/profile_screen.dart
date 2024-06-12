import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/providers/authentication_provider.dart';
import 'package:blog_app/providers/user_provider.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _newEmail;
  String? _newPassword;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.userInfo;
    final authenticator = context.read<AuthenticationProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColor.appBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: user.profileImg.startsWith('assets/')
                        ? AssetImage(user.profileImg)
                        : FileImage(File(user.profileImg)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: user.email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newEmail = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'New Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newPassword = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_newEmail != null && _newPassword != null) {
                      authenticator.updateUserDetails(
                        user,
                        email: _newEmail,
                        password: _newPassword,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Profile updated successfully')),
                      );

                      Timer(
                        const Duration(seconds: 5),
                        () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text('Logout'),
                                content: Row(
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child:
                                          Text('Logging out, please wait...'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );

                          // Simulating the logout process
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop(); // Close the dialog
                            context.router.pushAndPopUntil(
                                const AuthenticationRoute(),
                                predicate: (r) => false);
                          });
                        },
                      );
                    }
                  }
                },
                child: const Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
