part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final String phoneNo;

  SendOtpEvent({required this.phoneNo});
}

class VerifyOtpEvent extends AuthEvent {
  final String phoneNo;
  final String otp;
  final String requestId;

  VerifyOtpEvent({
    required this.phoneNo,
    required this.otp,
    required this.requestId,
  });
}

class RefreshAccessTokenEvent extends AuthEvent {}
