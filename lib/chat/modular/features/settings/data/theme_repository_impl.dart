import 'package:shared_preferences/shared_preferences.dart';
import '../domain/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  @override
  Future<bool> getPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  @override
  Future<void> savePrefs(String key, bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, isDark);
  }
}
