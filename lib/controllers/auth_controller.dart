// AuthController
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

    try {
      var response = await ApiService.login(email, password, fcmToken!);

      if (response != null) {
        // Navigate to ProfileScreen after successful login
        Get.to(() => ProfileScreen(token: response['token']));
      } else {
        Get.snackbar("Login Error", "Invalid email or password",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      Get.snackbar("Login Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading = false;
      update();
    }
  }
}
