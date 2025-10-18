import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController categoryController, required this.labelText, this.keyboardType, required this.icon,
  }) : _categoryController = categoryController;

  final TextEditingController _categoryController;
  final String labelText;  
  final dynamic keyboardType; 
final Icon icon ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _categoryController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}