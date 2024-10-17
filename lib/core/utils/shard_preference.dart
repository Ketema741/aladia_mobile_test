import 'package:shared_preferences/shared_preferences.dart';

class ShardPrefHelper {
  static late SharedPreferences _preferences;
  static const String _ktoken = 'token';
  static const String _userId = 'userID';
  static const String _profileImage = 'profileImage';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  /// Set Token
  static Future setToken(String token) async =>
      await _preferences.setString(_ktoken, token);
  static String? getToken() => _preferences.getString(_ktoken);

  /// Set Installed
  static Future setInstalled() async =>
      await _preferences.setString("installed", "installed");
  static String? getIsInstalled() => _preferences.getString("installed");

  /// Set UserId
  static Future setUserId(String userId) async =>
      await _preferences.setString(_userId, userId);
  static String? getUserId() => _preferences.getString(_userId);

  /// Set Profile Image
  static Future setProfileImage(String profileImage) async =>
      await _preferences.setString(_profileImage, profileImage);
  static String? getProfileImage() => _preferences.getString(_profileImage);

  /// Clear all
  static Future<bool> clear() async {
    await _preferences.clear();
    return true;
  }
}
