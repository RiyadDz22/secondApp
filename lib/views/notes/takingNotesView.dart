import 'package:flutter/material.dart';
import 'package:second_app/constants/routes.dart';
import 'package:second_app/crud/crud_service.dart';

class TakingNotesView extends StatefulWidget {
  const TakingNotesView({Key? key}) : super(key: key);

  @override
  State<TakingNotesView> createState() => _TakingNotesViewState();
}

class _TakingNotesViewState extends State<TakingNotesView> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('taking a note...'),
        ),
        body: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                hintText: 'title',
              ),
              maxLines: null,
            ),
            TextField(
              controller: description,
              decoration: const InputDecoration(
                hintText: 'write your note here',
              ),
              keyboardType: TextInputType.multiline,
            ),
            FloatingActionButton(
              onPressed: () async {
                await SQLHelper.createItem(title.text, description.text);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(homeRoute, (route) => false);
              },
              child: const Icon(Icons.check),
            ),
          ],
        ));
  }
}
