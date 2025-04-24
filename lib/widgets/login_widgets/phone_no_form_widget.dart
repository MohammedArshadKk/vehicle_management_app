import 'package:flutter/material.dart';

class PhoneNoFormWidget extends StatelessWidget {
  const PhoneNoFormWidget({super.key, required this.phoneController});
final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              '+91',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter phone number',
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                  return 'Enter a valid 10-digit number';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
