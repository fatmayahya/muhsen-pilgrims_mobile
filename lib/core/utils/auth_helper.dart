import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('passport');
    await prefs.remove('mobile');
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    return token != null && token.isNotEmpty;
  }

  static Future<String?> getPassport() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('passport');
  }

  static Future<String?> getMobile() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('mobile');
  }
}