import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  static Future<String?> getFCMToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? fcmToken = await messaging.getToken();
      print('FCM Token: $fcmToken');

      
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
        print('FCM Token Refreshed: $newToken');
      });

      return fcmToken;
    } catch (e) {
      print('Error fetching FCM token: $e');
      return null;  
    }
  }
}
