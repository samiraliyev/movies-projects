import 'package:app_theme/src/app_theme.dart';
import 'package:app_theme/src/app_theme_provider.dart';
import 'package:flutter/material.dart';

extension AppThemeExt on BuildContext {
  AppTheme get theme => AppThemeProvider.of(this);
}
