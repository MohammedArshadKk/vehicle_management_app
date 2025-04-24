import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vehicle_management_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:vehicle_management_app/screens/dashboard_screen.dart';
import 'package:vehicle_management_app/screens/enter_name_screen.dart';
import 'package:vehicle_management_app/widgets/common_widgets/error_message.dart';
import 'package:vehicle_management_app/widgets/common_widgets/loading_widget.dart';

class OtpFieldWidget extends StatelessWidget {
  const OtpFieldWidget({
    super.key,
    required this.phoneNo,
    required this.requestId,
    required this.otpController,
  });
  final String phoneNo;
  final String requestId;
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          customLoading(context);
        } else if (state is OtpVerifiedState) {
          Navigator.pushAndRemoveUntil( 
            context, 
            MaterialPageRoute(builder: (context) => EnterNameScreen()),
            (route) => false,
          );
        } else if (state is AuthErrorState) {
          showErrorMessage(
            context: context,
            message: 'Oops! That OTP didn’t match. Try again.',
            onTap: () {
              Navigator.pop(context);
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: false,
          controller: otpController,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: 60,
            fieldWidth: 50,
            activeFillColor: Colors.white,
            activeColor: Colors.grey.shade300,
            selectedFillColor: Colors.white,
            selectedColor: Colors.grey.shade300,
            inactiveFillColor: Colors.white,
            inactiveColor: Colors.grey.shade300,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          onCompleted: (v) {
            final String otp = v.toString();
            context.read<AuthBloc>().add(
              VerifyOtpEvent(phoneNo: phoneNo, otp: otp, requestId: requestId),
            );
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }
}
