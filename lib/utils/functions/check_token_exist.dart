
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> checkTokenExist() async {
  final storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: 'access_token');
  String? refreshToken = await storage.read(key: 'refresh_token');
  return accessToken != null && refreshToken != null;
}
