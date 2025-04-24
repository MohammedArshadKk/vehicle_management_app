import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';

class HeaderAndUserAvatarWidget extends StatelessWidget {
  const HeaderAndUserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What shall we call you?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter full name as on your Aadhar Card',
                style: TextStyle(fontSize: 14, color: AppColors.textMedium),
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Center(
              child: Icon(
                Icons.person,
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
