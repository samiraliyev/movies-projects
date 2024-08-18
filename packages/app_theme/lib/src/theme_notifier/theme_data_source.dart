import 'package:shared_preferences/shared_preferences.dart';

String _kTheme = 'theme';

abstract interface class ThemeDataSource {
  bool? get isDark;
  Future<void> persistIsDark(bool isDark);
}

class ThemeDataSourceImpl implements ThemeDataSource {
  const ThemeDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  bool? get isDark => sharedPreferences.getBool(_kTheme);

  @override
  Future<void> persistIsDark(bool isDark) {
    return sharedPreferences.setBool(_kTheme, isDark);
  }
}
