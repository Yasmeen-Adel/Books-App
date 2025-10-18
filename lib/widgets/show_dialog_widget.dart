import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({
    super.key,
    required this.book,
  });

  final QueryDocumentSnapshot<Object?> book;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title:Text('Confirm Delete',style: TextStyle(fontWeight: FontWeight.bold)),
      content: Text(
        'Are you sure you want to delete "${book['name']}"?',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('Delete', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
