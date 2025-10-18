import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference booksCollection = FirebaseFirestore.instance
      .collection('books');

  // Add
  Future<void> addBook(String name, String category, String price) async {
    try {
      await booksCollection.add({
        'name': name,
        'category': category,
        'price': price,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add book: $e');
    }
  }

  // Get
  Stream<QuerySnapshot> getBooks() {
    return booksCollection.orderBy('createdAt', descending: true).snapshots();
  }

  // Delete
  Future<void> deleteBook(String id) async {
    try {
      await booksCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete book: $e');
    }
  }
}
