import 'package:app_theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genre_service/genre_service.dart';
import 'package:localization/localization.dart';

import '../services/services.dart';

final localizationDataSourceProvider = Provider<LocalizationDataSource>((ref) {
  return LocalizationDataSourceImpl(ref.watch(sharedPrefsProvider));
});

final themeDataSource = Provider<ThemeDataSource>((ref) {
  return ThemeDataSourceImpl(
    ref.watch(sharedPrefsProvider),
  );
});

/// Our Logic for the data sources

final genreRemoteDataSourceProvider = Provider<GenreRemoteDataSource>((ref) {
  return GenreRemoteDataSourceImpl(
    apiService: ref.watch(apiServiceProvider),
  );
});
