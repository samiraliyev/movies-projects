

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import 'data_sources.dart';

final localizationNotifierProvider = StateNotifierProvider<LocalizationNotifier, LocalizationState>((ref){
  return LocalizationNotifier(
    localizationDataSource: ref.watch(localizationDataSourceProvider),
  );
});

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref){
  return ThemeNotifier(
    themeDataSource: ref.watch(themeDataSource)
  );
});