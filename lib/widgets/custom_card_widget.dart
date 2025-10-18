import 'package:firestore_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required TextEditingController nameController,
    required TextEditingController categoryController,
    required TextEditingController priceController,
  }) : _nameController = nameController, _categoryController = categoryController, _priceController = priceController;

  final TextEditingController _nameController;
  final TextEditingController _categoryController;
  final TextEditingController _priceController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.book_outlined,
              size: 60,
              color: Colors.deepPurple,
            ),
            SizedBox(height: 20),
            Text(
              'Book Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 24),
    
            CustomTextField(
              categoryController: _nameController,
              labelText: 'Book Name',
              icon: Icon(Icons.book, color: Colors.deepPurple),
            ),
    
            SizedBox(height: 16),
    
            CustomTextField(
              categoryController: _categoryController,
              labelText: 'Category',
              icon: Icon(Icons.category, color: Colors.deepPurple),
            ),
            SizedBox(height: 16),
            CustomTextField(
              categoryController: _priceController,
              labelText: 'Price',
              keyboardType: TextInputType.number, 
              icon: Icon(Icons.attach_money, color: Colors.deepPurple),
            ),
            
          ],
        ),
      ),
    );
  }
}
