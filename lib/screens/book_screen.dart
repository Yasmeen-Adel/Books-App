import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_project/screens/add_book_screen.dart' show AddBookScreen;
import 'package:firestore_project/widgets/card_book_widget.dart';
import 'package:firestore_project/widgets/home_body_screen.dart';
import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
class BookScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Books Library",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
    
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.deepPurple),
            );
          }
    
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: HomeBodyScreen(),
            );
          }
    
          final books = snapshot.data!.docs;
    
          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookCard(book: books[index], firestoreService: firestoreService);
            },
          );
        },
      ),
    
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBookScreen()),
          );
        },
        icon: Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Book',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

