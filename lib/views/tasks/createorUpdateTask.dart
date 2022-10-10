import 'package:flutter/material.dart';
import 'package:second_app/cloud_database/cloud_task.dart';
import 'package:second_app/cloud_database/firebase_cloud_storage.dart';

class CreateOrUpdateTaskView extends StatefulWidget {
  const CreateOrUpdateTaskView({Key? key}) : super(key: key);

  @override
  State<CreateOrUpdateTaskView> createState() => _CreateOrUpdateTaskViewState();
}

class _CreateOrUpdateTaskViewState extends State<CreateOrUpdateTaskView> {
  @override
  Widget build(BuildContext context) {
    CloudTask? _task;
    late final FirebaseCloudStorage _taskService;
    late final TextEditingController _textController;
    initState() {
      _taskService = FirebaseCloudStorage();
      _textController = TextEditingController();
      super.initState();
    }

    void _textControllerListner() async {
      final task = _task;
      if (task == null) {
        return;
      }
      final text = _textController.text;
      await _taskService.updateTask(documentId: task.documentId, text: text);
    }

      void _setupTextControllerListener(){
    _textController.removeListener(_textControllerListner);
    _textController.addListener(_textControllerListner);
  }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create new task'),
      ),
      body: TextField(),
    );
  }
}
