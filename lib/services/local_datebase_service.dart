import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDatebaseService {
  static const _pnlCacheKey = 'cached_pnl_data';

  static Future<void> cachePnlData(
    Map<String, dynamic> data,
    String type,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_pnlCacheKey-$type', jsonEncode(data));
  }

  static Future<Map<String, dynamic>?> getCachedPnlData(String type) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString('$_pnlCacheKey-$type');
    if (jsonStr != null) {
      return jsonDecode(jsonStr);
    }
    return null;
  }

  static Future<void> clearCachedPnl(String type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_pnlCacheKey-$type');
  }
}
