import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Future<bool> checkTokenExpired() async {
  final storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: 'access_token');
  if (accessToken == null || accessToken.isEmpty) {
    return true;
  }
  bool hasExpired = JwtDecoder.isExpired(accessToken);
  return hasExpired;
}
