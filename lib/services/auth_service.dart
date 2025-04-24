import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vehicle_management_app/utils/constants.dart';

class AuthService {
  final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  Future<String> sendOtp(String phone) async {
    final response = await _dio.post(
      '$baseUrl/sendOtp',
      data: {"country_code": "+91", "phone_number": phone},
    );
    log(response.data.toString());
    return response.data['request_id'];
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String phone,
    required String otp,
    required String requestId,
  }) async {
    final response = await _dio.post(
      '$baseUrl/verifyOtp',
      data: {
        "country_code": "+91",
        "phone_number": phone,
        "otp": otp,
        "request_id": requestId,
        "user": "mfo",
        "fcm_token": "testFcmToken",
      },
    );

    final token = response.data['access_token'];
    final refreshToken = response.data['refresh_token'];

    await _secureStorage.write(key: 'access_token', value: token);
    await _secureStorage.write(key: 'refresh_token', value: refreshToken);

    return response.data;
  }

  Future<void> refreshAccessToken() async {
    final refreshToken = await _secureStorage.read(key: 'refresh_token');

    try {
      final response = await _dio.get(
        '$baseUrl/refreshAccessToken',
        data: {"refresh_token": refreshToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => status! < 500,
        ),
      );

      final newToken = response.data['access_token'];
      log(newToken.toString()); 
      await _secureStorage.write(key: 'access_token', value: newToken);

      log('Token refreshed successfully!');
    } catch (e) {
      log('Failed to refresh token: $e');   
    }
  }



}
