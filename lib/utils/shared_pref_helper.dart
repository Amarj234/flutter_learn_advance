import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String _tokenKey = 'token';
  static const String _addressKey = 'current_address';

  /// Save auth token to SharedPreferences
  static Future<void> setAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  /// Retrieve auth token from SharedPreferences
  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Clear auth token (e.g., on logout)
  static Future<void> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // ----------------------------
  // ✅ Address-related methods
  // ----------------------------

  /// Save current address
  static Future<void> saveCurrentAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_addressKey, address);
  }

  /// Get current address
  static Future<String?> getCurrentAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_addressKey);
  }

  /// Clear current address
  static Future<void> clearCurrentAddress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_addressKey);
  }
}
