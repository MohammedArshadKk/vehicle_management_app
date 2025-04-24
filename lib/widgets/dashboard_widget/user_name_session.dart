import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';

Widget userNameSession(String name) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(
            'assets/FleetWiseIcon.png',
            width: 40,
            height: 40,
            color: AppColors.backgroundColor, 
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Namaste",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("🙏", style: TextStyle(fontSize: 16)),
                ],
              ),
              Text(
                name, 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }