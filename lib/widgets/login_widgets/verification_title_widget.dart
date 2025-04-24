import 'package:flutter/material.dart';

class VerificationTitleWidget extends StatelessWidget {
  const VerificationTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Verify Number',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A3C5E),
      ),
    );
  }
}
