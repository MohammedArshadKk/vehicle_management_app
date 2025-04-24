import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';

class ChangeNumberWidget extends StatelessWidget {
  const ChangeNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'change your mobile number',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
