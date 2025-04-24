import 'package:flutter/material.dart';

void showErrorMessage({
  required BuildContext context,
  required String message,
  required VoidCallback onTap,
  String text = 'OK',
}) {
  const Color errorColor = Colors.red;

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.error_outline, color: errorColor),
              SizedBox(width: 8),
              Text(
                'Error',
                style: TextStyle(
                  color: errorColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(message, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () => onTap,
              child: Text(text, style: TextStyle(color: errorColor)),
            ),
          ],
        ),
  );
}
