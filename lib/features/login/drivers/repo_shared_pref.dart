import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Future<bool> login(String email, String password) async {
    if (email == 'user@example.com' && password == 'password') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setBool('isLoggedIn', true);

      return true;
    }

    return false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
