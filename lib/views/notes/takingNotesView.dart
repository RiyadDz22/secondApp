import 'package:flutter/material.dart';

import '../../crud/crud_service.dart';

class TakingNotesView extends StatefulWidget {
  const TakingNotesView({Key? key}) : super(key: key);

  @override
  State<TakingNotesView> createState() => _TakingNotesViewState();
}

class _TakingNotesViewState extends State<TakingNotesView> {
  List<Map<String, dynamic>> _notes = [];
  bool _isLoading = true;

  void _refrechNotes() async {
    final data = await SqlHelper.getNotes();
    setState(() {
      _notes = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _refrechNotes();
    super.initState();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  get id => _showNotes(id);

  void _showNotes(int? id) async {
    if (id != null) {
      final existingNote = _notes.firstWhere((element) => element['id'] == id);
      _titleController.text = existingNote['title'];
      _descriptionController.text = existingNote['description'];
    }
  }

  Future<void> _addItem() async {
    SqlHelper.createNote(_titleController.text, _descriptionController.text);
    _refrechNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('taking a note..'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration:
                const InputDecoration(hintText: 'Write your note here...'),
          ),
          FloatingActionButton(
            onPressed: () async {
              if (id == null) {
                await _addItem();
              }
              if (id != null) {}
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
