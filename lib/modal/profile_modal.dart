import 'dart:convert';
import 'dart:io';

import 'package:blog_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileModal extends StatefulWidget {
  const ProfileModal({super.key});

  @override
  State<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
  final textController = TextEditingController();
  File? _pickedImage;

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

  void save() async {
// first save to local storage
    final pref = await SharedPreferences.getInstance();
    Map<String, String> data = {
      "userName": textController.text,
      "image": _pickedImage == null
          ? 'assets/images/add/user_image.png'
          : _pickedImage!.path,
    };
    String encodedMap = jsonEncode(data);
    pref.setString('userData', encodedMap);

// then save to provider
    if (!mounted) {
      return;
    }
    final provider = context.read<UserProvider>();
    if (_pickedImage == null && textController.text.isNotEmpty) {
      provider.setNameOnly(textController.text);
      return;
    }

    if (textController.text.isEmpty && _pickedImage != null) {
      provider.setProfileImageOnly(_pickedImage!.path);
      return;
    }

    context.read<UserProvider>().setUserData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: _pickedImage != null
                    ? FileImage(_pickedImage!) as ImageProvider
                    : const AssetImage("assets/images/add/user_image.png"),
              ),
              TextButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.camera),
                label: const Text('Add Image'),
              ),
            ],
          ),
          TextField(
            controller: textController,
            maxLength: 20,
            decoration: InputDecoration(
                labelText: 'User Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
          ElevatedButton(
            onPressed: () {
              save();
              Navigator.of(context).pop(textController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            child: const Text('Create'),
          )
        ],
      ),
    );
  }
}
