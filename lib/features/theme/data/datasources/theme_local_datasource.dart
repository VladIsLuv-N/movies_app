import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalDatasource {
  final SharedPreferences prefs;

  ThemeLocalDatasource({required this.prefs});

  static const _key = 'theme_mode';

  Future<String?> getTheme() async {
    return prefs.getString(_key);
  }

  Future<void> saveTheme(String value) async {
    await prefs.setString(_key, value);
  }
}
