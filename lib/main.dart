import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_task/ui/login_screen.dart';
import 'package:flutter_api_task/utils/color.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyC_j3dCpZ_WmD7J8M-9GqfgFnbJeEXTbGQ',
        appId: '1:628360151810:android:d270b9edcb2e3a0846f81b',
        messagingSenderId: '628360151810',
        projectId: 'flutter-api-task'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter API Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        useMaterial3: false,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
