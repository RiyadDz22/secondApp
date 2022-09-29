import 'package:flutter/material.dart';
import 'package:second_app/views/login_view.dart';
import 'package:second_app/views/register_view.dart';
import 'package:second_app/views/tasks_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        taskRoute: (context) => const TaskView(),
      },
    );
  }
}

