import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    required bool isLoading,
  }) : _isLoading = isLoading;

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _isLoading ? null : () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey[700],
        side: BorderSide(color: Colors.grey[400]!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        'Cancel',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
