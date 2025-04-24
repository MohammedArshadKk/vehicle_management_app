import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vehicle_management_app/services/local_datebase_service.dart';
import 'package:vehicle_management_app/utils/constants.dart';

class PnlService {
  final Dio _dio = Dio();
  final _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> getPnL(
    String type, {
    bool refresh = false,
  }) async {
    if (!refresh) {
      final cached = await LocalDatebaseService.getCachedPnlData(type);
      if (cached != null) {
        log('Loaded $type PnL from cache');
        return cached;
      }
    }
    final token = await _storage.read(key: 'access_token');
    final headers = {'Authorization': 'Bearer $token'};

    final response = await _dio.get(
      '$baseUrl/get${type}PorterPnL',
      options: Options(headers: headers),
    );
    final data = response.data['data'];
    await LocalDatebaseService.cachePnlData(data, type);

    return data;
  }
}
