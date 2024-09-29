import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  static Future<String?> getFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? fcmToken = await messaging.getToken();
    print('FCM Token: $fcmToken');
    return fcmToken;
  }
}
