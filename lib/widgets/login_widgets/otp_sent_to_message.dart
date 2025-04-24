import 'package:flutter/material.dart';

class OtpSentToMessage extends StatelessWidget {
  const OtpSentToMessage({super.key, required this.phoneNo});
  final String phoneNo;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan( 
        style: TextStyle(fontSize: 16, color: Colors.black54),
        children: [
          TextSpan(text: 'OTP sent to '),
          TextSpan(
            text: '+91 $phoneNo',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
