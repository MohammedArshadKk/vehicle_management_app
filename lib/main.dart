import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_management_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:vehicle_management_app/blocs/pnl_bloc/pnl_bloc.dart';
import 'package:vehicle_management_app/screens/phone_no_login_screen.dart';
import 'package:vehicle_management_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => PnlBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FleetWise App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.interTextTheme(),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
