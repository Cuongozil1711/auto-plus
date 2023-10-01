import 'package:shared_preferences/shared_preferences.dart';

class UserTokenManager {
  static const String _tokenKey = 'auth_user_token';

  // Lưu user_token vào SharedPreferences
  static Future<void> saveUserToken(String userToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, userToken);
  }

  // Truy xuất user_token từ SharedPreferences
  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Xóa user_token khỏi SharedPreferences
  static Future<void> removeUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
