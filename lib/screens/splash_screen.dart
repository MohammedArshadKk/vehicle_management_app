import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:vehicle_management_app/blocs/pnl_bloc/pnl_bloc.dart';
import 'package:vehicle_management_app/screens/dashboard_screen.dart';
import 'package:vehicle_management_app/screens/enter_name_screen.dart';
import 'package:vehicle_management_app/screens/phone_no_login_screen.dart';
import 'package:vehicle_management_app/utils/functions/check_token_exist.dart';
import 'package:vehicle_management_app/utils/functions/check_token_expired.dart';
import 'package:vehicle_management_app/utils/functions/check_user_name_exist.dart';
import 'package:vehicle_management_app/widgets/login_widgets/feet_waise_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _handleNavigation();
    super.initState();
  }

  Future<void> _handleNavigation() async {
    await Future.delayed(Duration(seconds: 5));

    final bool isTokenExist = await checkTokenExist();
    final bool isNameExist = await checkUserNameExist();
    final bool isExpired = await checkTokenExpired();

    if (!mounted) return;
    log(isExpired.toString());
    if (isExpired && isTokenExist) {
      log('isExpired');
      context.read<AuthBloc>().add(RefreshAccessTokenEvent());
      context.read<PnlBloc>().add(FetchDataEvent(type: 'Yesterday'));
    }
    if (isTokenExist && isNameExist) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else if (isTokenExist && !isNameExist) {
      log('good');
      if (isExpired) {
        context.read<AuthBloc>().add(RefreshAccessTokenEvent());
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => EnterNameScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PhoneNoLoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [FeetWaiseTextWidget()],
      ),
    );
  }
}
