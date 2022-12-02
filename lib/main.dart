import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_app/firebase_things/google_signin.dart';
import 'package:second_app/views/Home.dart';
import 'package:second_app/views/login_view.dart';
import 'package:second_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().handleAuthState(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        homeRoute: (context) => const HomeView(),
      },
    );
  }
}
