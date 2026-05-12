import 'package:database_2/model/note_model.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  final Note? note;
  const NotePage({super.key, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  bool _isSalving = false;

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final authorController = TextEditingController();

  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      authorController.text = widget.note!.author;
    }
  }

  void disposse() {
    titleController.dispose();
    contentController.dispose();
    authorController.dispose();
    super.dispose();
  }

  // save note
  void saveNote() async {
    if (_isSalving) return;

    _isSalving = true;

    if (!mounted) return;

    // validasi input
    if (titleController.text.trim().isEmpty &&
        contentController.text.trim().isEmpty) {
      Navigator.pop(context);
      return;
    }

    final now = DateTime.now().toIso8601String();

    final note = Note(
      id: widget.note?.id,
      title: titleController.text,
      content: contentController.text,
      author: authorController.text,
      createdAt: widget.note?.createdAt ?? now,
      updatedAt: now,
    );
    // title: titleController.text,
    // content: contentController.text,
    // author: authorController.text,

    Navigator.pop(context, note);
  }

  void deleteNote() async {
    final navigator = Navigator.of(context);
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("konfirmasi"),
        content: Text("Yakin Ingin di hapus"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Batal"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Hapus"),
          ),
        ],
      ),
    );

    if (!mounted) return;
    {
      if (confirm == true) {
        navigator.pop("delete");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop || _isSalving) return;

          {
            saveNote();
          }
        },

        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: saveNote,
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: deleteNote,
                icon: Icon(Icons.delete_outlined),
              ),
            ],
          ),

          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  autofocus: true, // autofocus
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context).textTheme.titleLarge,
                  decoration: InputDecoration(
                    hintText: "judul",
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 10),

                Expanded(
                  child: TextField(
                    controller: contentController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: "tulis catatan",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Divider(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
