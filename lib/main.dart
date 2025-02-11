import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_exam/screen/splash_screen.dart';
import 'package:get/get.dart';
import 'screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'SplashScreen',
    home: HomePage(),
    getPages: [
      GetPage(name: '/SplashScreen', page: () => SplashScreen()),
    ],
  ));
}
