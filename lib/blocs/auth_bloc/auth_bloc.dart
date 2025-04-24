import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vehicle_management_app/blocs/pnl_bloc/pnl_bloc.dart';
import 'package:vehicle_management_app/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SendOtpEvent>(sendOtpEvent);
    on<VerifyOtpEvent>(verifyOtpEvent);
    on<RefreshAccessTokenEvent>(refreshAccessTokenEvent);
  }
  final AuthService authService = AuthService();
  FutureOr<void> sendOtpEvent(
    SendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      String requestId = await authService.sendOtp(event.phoneNo);
      emit(OtpSendState(requestId: requestId));
    } catch (e) {
      String error = e.toString();
      log(error);
      emit(AuthErrorState(error: error));
    }
  }

  FutureOr<void> verifyOtpEvent(
    VerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());
      final Map<String, dynamic> data = await authService.verifyOtp(
        phone: event.phoneNo,
        otp: event.otp,
        requestId: event.requestId,
      );
      log(data.toString());
      emit(OtpVerifiedState());
    } catch (e) {
      String error = e.toString();
      log(error);
      emit(AuthErrorState(error: 'Invalid Otp.'));
    }
  }

  FutureOr<void> refreshAccessTokenEvent(
    RefreshAccessTokenEvent event,
    Emitter<AuthState> emit,
  ) async{
   await authService.refreshAccessToken();
   
  }
}
