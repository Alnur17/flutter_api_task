import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profile_controller.dart';
import '../utils/color.dart';
import '../utils/text_style.dart';

class UpdateProfileScreen extends StatefulWidget {
  final String token;
  UpdateProfileScreen({required this.token});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final ProfileController profileController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile", style: AppTextStyle.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: bloodGroupController,
              decoration: InputDecoration(labelText: 'Blood Group'),
            ),
            SizedBox(height: 20),
            _image == null
                ? Text("No image selected.", style: AppTextStyle.body)
                : Image.file(File(_image!.path)),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: _pickImage,
              child: Text("Pick Profile Image", style: AppTextStyle.button),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {
                profileController.updateProfile(
                  widget.token,
                  nameController.text,
                  bloodGroupController.text,
                  _image,
                );
              },
              child: Text("Update Profile", style: AppTextStyle.button),
            ),
          ],
        ),
      ),
    );
  }
}
