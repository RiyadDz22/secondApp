import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_app/constants/routes.dart';
import 'package:second_app/firebase_things/firebase_auth_exceptions.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  try {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  } catch (e) {
                    throw GenericAuthException();
                  }
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: SingleChildScrollView(
          child: FloatingActionButton(
            onPressed: () async {
              
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}
