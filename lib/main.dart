
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/bottomnav.dart';
import 'package:food_app/pages/onboard.dart';
import 'package:food_app/pages/signup.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'firebase_options.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4.0,
          backgroundColor: Colors.blueGrey,
          contentTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:OnboardingScreen(),
    );
  }
}