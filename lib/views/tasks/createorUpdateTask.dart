import 'package:flutter/material.dart';

class CreateOrUpdateTaskView extends StatefulWidget {
  const CreateOrUpdateTaskView({Key? key}) : super(key: key);

  @override
  State<CreateOrUpdateTaskView> createState() => _CreateOrUpdateTaskViewState();
}

class _CreateOrUpdateTaskViewState extends State<CreateOrUpdateTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new task'),
      ),
      body: TextField(

      ),
    );
  }
}
