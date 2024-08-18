import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_data_source.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier({
    required this.themeDataSource,
  }) : super(ThemeMode.dark) {
    try {
      final isDark = themeDataSource.isDark;

      if (isDark != null) {
        state = isDark ? ThemeMode.dark : ThemeMode.light;
      } else {
        // var brightness =
        //     SchedulerBinding.instance.platformDispatcher.platformBrightness;
        themeDataSource.persistIsDark(true);
        state = ThemeMode.dark;
        // state =
        //     brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
      }
    } catch (_) {}
  }

  final ThemeDataSource themeDataSource;

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    themeDataSource.persistIsDark(state == ThemeMode.dark);
  }
}
