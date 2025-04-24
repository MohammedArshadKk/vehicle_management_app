import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:vehicle_management_app/screens/otp_verification_screen.dart';
import 'package:vehicle_management_app/utils/colors.dart';
import 'package:vehicle_management_app/widgets/common_widgets/error_message.dart';
import 'package:vehicle_management_app/widgets/common_widgets/loading_widget.dart';

class GetOtpButtonWidget extends StatelessWidget {
  const GetOtpButtonWidget({
    super.key,
    required this.formKey,
    required this.phoneController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          customLoading(context);
        } else if (state is OtpSendState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => OtpVerificationScreen(
                    phoneNo: phoneController.text,
                    requestId: state.requestId,
                  ),
            ),
          );
        } else if (state is AuthErrorState) {
          showErrorMessage(
            context: context,
            message: 'Something went wrong. Please try again.',
            onTap: () {
              Navigator.pop(context);
            },
          );
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              context.read<AuthBloc>().add(
                SendOtpEvent(phoneNo: phoneController.text.trim()),
              );
            }
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'GET OTP',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
