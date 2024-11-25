abstract class ThemeRepository {
  Future<void> savePrefs(String key, bool isDark);

  Future<bool> getPrefs(String key);
}