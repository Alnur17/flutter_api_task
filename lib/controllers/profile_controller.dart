import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/api_services.dart';

class ProfileController extends GetxController {
  
  User user = User(name: '', email: '', bloodGroup: '');

  Future<void> fetchProfile(String token) async {
    try {
      var data = await ApiService.fetchProfile(token);

      if (data != null) {
        user = User.fromJson(data);  
        update();  
      }
    } catch (error) {
      
      print("Error fetching profile: $error");
    }
  }

  Future<void> updateProfile(String token, String name, String bloodGroup, dynamic image) async {
    try {
      var success = await ApiService.updateProfile(token, name, bloodGroup, image);

      if (success) {
        fetchProfile(token);  
      }
    } catch (error) {
      
      print("Error updating profile: $error");
    }
  }
}
