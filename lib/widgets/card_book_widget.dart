import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_project/services/firestore_service.dart';
import 'package:firestore_project/widgets/show_dialog_widget.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final QueryDocumentSnapshot book;
  final FirestoreService firestoreService;

  const BookCard({required this.book, required this.firestoreService});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 60,
          height: 80,
          decoration: BoxDecoration(
            // color: Colors.purpleAccent,
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.book, color: Colors.white, size: 35),
        ),
        title: Text(
          book['name'],
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Icon(Icons.category_outlined, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Text(
                book['category'],
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '\$ ${book['price']}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 24),
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return ShowDialogWidget(book: book);
                  },
                );

                if (confirmed == true) {
                  await firestoreService.deleteBook(book.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                       Text('Book deleted successfully'),
                    
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              
            ),
          ],
        ),
      ),
    );
  }
}
