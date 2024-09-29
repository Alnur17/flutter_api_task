import 'package:flutter/material.dart';
import 'package:flutter_api_task/ui/update_profile_screen.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../utils/color.dart';
import '../utils/text_style.dart';

class ProfileScreen extends StatelessWidget {
  final String token;
  ProfileScreen({super.key, required this.token});

  final ProfileController profileController = Get.put(ProfileController());

  void initState() {
    profileController.fetchProfile(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: AppTextStyle.title)),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          final user = controller.user;
          return user.name.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${user.name}", style: AppTextStyle.body),
                SizedBox(height: 10),
                Text("Email: ${user.email}", style: AppTextStyle.body),
                SizedBox(height: 10),
                Text("Blood Group: ${user.bloodGroup}", style: AppTextStyle.body),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    Get.to(() => UpdateProfileScreen(token: token));
                  },
                  child: Text("Update Profile", style: AppTextStyle.button),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
