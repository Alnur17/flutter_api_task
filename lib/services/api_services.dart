import 'package:flutter_api_task/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<Map<String, dynamic>?> login(String email, String password, String fcmToken) async {
    var response = await http.post(
      Uri.parse(Constants.loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'fcmToken': fcmToken,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  static Future<Map<String, dynamic>?> register(String name, String email, String password, String fcmToken) async {
    var response = await http.post(
      Uri.parse(Constants.registerUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'fcmToken': fcmToken,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  static Future<Map<String, dynamic>?> fetchProfile(String token) async {
    var response = await http.get(
      Uri.parse(Constants.profileUrl),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch profile: ${response.body}');
    }
  }

  static Future<bool> updateProfile(String token, String name, String bloodGroup, dynamic image) async {
    var request = http.MultipartRequest('PATCH', Uri.parse(Constants.updateProfileUrl));
    request.headers['Authorization'] = 'Bearer $token';

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('profilePicture', image.path));
    }

    request.fields['data'] = jsonEncode({
      'name': name,
      'bloodGroup': bloodGroup,
    });

    var response = await request.send();
    return response.statusCode == 200;
  }
}
