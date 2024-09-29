import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/api_services.dart';

class ProfileController extends GetxController {
  
  User user = User(name: '', email: '', bloodGroup: '');

  
  bool isLoading = false;

  Future<void> fetchProfile(String token) async {
    isLoading = true; 
    update(); 

    try {
      var data = await ApiService.fetchProfile(token);

      if (data != null) {
        user = User.fromJson(data);
        update(); 
      }
    } catch (error) {
      print("Error fetching profile: $error");
    } finally {
      isLoading = false; 
      update(); 
    }
  }

  Future<void> updateProfile(String token, String name, String bloodGroup, dynamic image) async {
    isLoading = true; 
    update(); 

    try {
      var success = await ApiService.updateProfile(token, name, bloodGroup, image);

      if (success) {
        await fetchProfile(token);  
      }
    } catch (error) {
      print("Error updating profile: $error");
    } finally {
      isLoading = false; 
      update(); 
    }
  }
}
