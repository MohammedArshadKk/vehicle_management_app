import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';
import 'package:vehicle_management_app/widgets/login_widgets/header_and_user_avatar_widget.dart';
import 'package:vehicle_management_app/widgets/login_widgets/name_input_field_widget.dart';
import 'package:vehicle_management_app/widgets/login_widgets/submit_button_widget.dart';

class EnterNameScreen extends StatelessWidget {
  EnterNameScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              HeaderAndUserAvatarWidget(),
              const SizedBox(height: 30),
              Form(
                key: formkey,
                child: NameInputFieldWidget(nameController: nameController),
              ),
              const Spacer(),
              SubmitButtonWidget(
                formkey: formkey,
                nameController: nameController,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
