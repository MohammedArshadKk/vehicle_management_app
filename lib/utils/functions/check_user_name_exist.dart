import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkUserNameExist() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('name') != null;
}
