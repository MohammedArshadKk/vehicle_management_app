import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';
import 'package:vehicle_management_app/widgets/login_widgets/feet_waise_text_widget.dart';
import 'package:vehicle_management_app/widgets/login_widgets/get_otp_button_widget.dart';
import 'package:vehicle_management_app/widgets/login_widgets/login_or_register_text.dart';
import 'package:vehicle_management_app/widgets/login_widgets/phone_no_form_widget.dart';
import 'package:vehicle_management_app/widgets/login_widgets/policy_text_widget.dart';

class PhoneNoLoginScreen extends StatelessWidget {
  PhoneNoLoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FeetWaiseTextWidget(),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginOrRegisterText(),
                            const SizedBox(height: 15),
                            PhoneNoFormWidget(phoneController: phoneController),
                            const SizedBox(height: 20),
                            PolicyTextWidget(),
                            const SizedBox(height: 20),
                            GetOtpButtonWidget(
                              formKey: formKey,
                              phoneController: phoneController,
                            ),
                            const Spacer(flex: 2),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
