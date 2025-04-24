import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';

void customLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => Center(
          child: CircularProgressIndicator(color: AppColors.backgroundColor),
        ),
  );
}
