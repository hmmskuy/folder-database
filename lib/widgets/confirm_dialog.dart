import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<bool> showConfirmDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (Context) => AlertDialog(
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
      ) ??
      false;
}
