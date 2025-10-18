import 'package:flutter/material.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.book_outlined, size: 100, color: Colors.grey[400]),
        SizedBox(height: 16),
        Text(
          'No books yet!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Add your Books',
          style: TextStyle(fontSize: 14, color: Colors.grey[500]),
        ),
      ],
    );
  }
}
