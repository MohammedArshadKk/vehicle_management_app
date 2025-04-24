import 'package:vehicle_management_app/services/auth_service.dart';

Future<void> refreshAccessToken()async{
final AuthService authService=AuthService();
await authService.refreshAccessToken();
}