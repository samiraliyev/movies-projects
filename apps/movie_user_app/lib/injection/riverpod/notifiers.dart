

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genre_service/genre_service.dart';
import 'package:localization/localization.dart';
import 'package:movie_user_app/injection/riverpod/use_caseses.dart';

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

final genreListNotifierProvider = StateNotifierProvider<GenreListNotifier, GenreListState>((ref){
  return GenreListNotifier(
    genreListUseCase: ref.watch(genreListUseCaseProvider)
  );
});