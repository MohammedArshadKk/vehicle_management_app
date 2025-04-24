import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_management_app/screens/dashboard_screen.dart';
import 'package:vehicle_management_app/utils/colors.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.formkey,
    required this.nameController,
  });
  final GlobalKey<FormState> formkey;
  final TextEditingController nameController;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (formkey.currentState!.validate()) {
          final SharedPreferences preferences =
              await SharedPreferences.getInstance();
          preferences.setString('name', nameController.text.trim());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
            (route) => false,
          );
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'SUBMIT',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textMedium,
            ),
          ),
        ),
      ),
    );
  }
}
