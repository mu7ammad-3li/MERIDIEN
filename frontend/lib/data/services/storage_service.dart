import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _tokenKey = 'jwt_token';
  static const String _tenantSlugKey = 'tenant_slug';
  static const String _userIdKey = 'user_id';

  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _prefs;

  StorageService({
    required FlutterSecureStorage secureStorage,
    required SharedPreferences prefs,
  })  : _secureStorage = secureStorage,
        _prefs = prefs;

  // JWT Token (Secure Storage)
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  // Tenant Slug (SharedPreferences)
  Future<void> saveTenantSlug(String slug) async {
    await _prefs.setString(_tenantSlugKey, slug);
  }

  String? getTenantSlug() {
    return _prefs.getString(_tenantSlugKey);
  }

  Future<void> deleteTenantSlug() async {
    await _prefs.remove(_tenantSlugKey);
  }

  // User ID (SharedPreferences)
  Future<void> saveUserId(String userId) async {
    await _prefs.setString(_userIdKey, userId);
  }

  String? getUserId() {
    return _prefs.getString(_userIdKey);
  }

  Future<void> deleteUserId() async {
    await _prefs.remove(_userIdKey);
  }

  // Clear all auth data
  Future<void> clearAll() async {
    await deleteToken();
    await deleteTenantSlug();
    await deleteUserId();
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
