import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soft_solution_app/Login_page.dart';
import 'Register_page.dart';
import 'package:get/get.dart';

import 'User_page.dart';
import 'otp_verification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: RegistrationPage());
  }
}
