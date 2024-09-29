import 'package:get/get.dart';

import '../services/api_services.dart';
import '../services/fcm_service.dart';
import '../ui/profile_screen.dart';

class AuthController extends GetxController {
  var isLoading = false;

  Future<void> login(String email, String password) async {
    String? fcmToken = await FCMService.getFCMToken();
    isLoading = true;
    update();

    var response = await ApiService.login(email, password, fcmToken!);

    if (response != null) {
      Get.to(() => ProfileScreen(token: response['token']));
    } else {
      // Handle login error
    }

    isLoading = false;
    update();
  }

  Future<void> register(String name, String email, String password) async {
    String? fcmToken = await FCMService.getFCMToken();
    isLoading = true;
    update();

    var response = await ApiService.register(name, email, password, fcmToken!);

    if (response != null) {
      Get.to(() => ProfileScreen(token: response['token']));
    } else {
      // Handle registration error
    }

    isLoading = false;
    update();
  }
}
