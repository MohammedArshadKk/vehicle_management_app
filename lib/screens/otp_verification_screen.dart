import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';
import 'package:vehicle_management_app/widgets/login_widgets/change_number_widget.dart';
import 'package:vehicle_management_app/widgets/login_widgets/enter_otp_text.dart';
import 'package:vehicle_management_app/widgets/login_widgets/otp_field_widget.dart';
import 'package:vehicle_management_app/widgets/login_widgets/otp_sent_to_message.dart';
import 'package:vehicle_management_app/widgets/login_widgets/verification_title_widget.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({
    super.key,
    required this.phoneNo,
    required this.requestId,
  });
  final String phoneNo;
  final String requestId;
  final TextEditingController otpController = TextEditingController(); 

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    VerificationTitleWidget(),
                    const SizedBox(height: 10),
                    OtpSentToMessage(phoneNo: phoneNo),
                    const SizedBox(height: 40),
                    EnterOtpText(),
                    const SizedBox(height: 20),
                    OtpFieldWidget(
                      phoneNo: phoneNo,
                      requestId: requestId,
                      otpController: otpController,
                    ),
                    const Spacer(),
                    ChangeNumberWidget(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
