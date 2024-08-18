

import 'package:app_theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import '../services/services.dart';

final localizationDataSourceProvider = Provider<LocalizationDataSource>((ref){
  return LocalizationDataSourceImpl(
    ref.watch(sharedPrefsProvider)
  );
});

final themeDataSource = Provider<ThemeDataSource>((ref){
  return ThemeDataSourceImpl(
    ref.watch(sharedPrefsProvider),
  );
});