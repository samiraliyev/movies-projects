import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'localization_data_source.dart';
import 'localization_state.dart';

class LocalizationNotifier extends StateNotifier<LocalizationState> {
  LocalizationNotifier({
    required this.localizationDataSource,
  })  : _selectedLanguageCode = 'az',
        super(const LocalizationState.initial()) {
    try {
      final languageCode = localizationDataSource.locale;

      if (languageCode != null) {
        _selectedLanguageCode = languageCode;
        Intl.defaultLocale = _selectedLanguageCode;
        state = state.copyWith(
          locale: Locale(languageCode),
          otherLocales: _filterLocales(languageCode),
        );
      } else {
        final defaultLocale = Platform.localeName.substring(0, 2);
        if (_languages.contains(defaultLocale)) {
          _selectedLanguageCode = defaultLocale;
          state = state.copyWith(
            locale: Locale(Platform.localeName.substring(0, 2)),
            otherLocales: _filterLocales(_selectedLanguageCode),
          );
        }
      }
    } catch (_) {}
  }

  final LocalizationDataSource localizationDataSource;
  String _selectedLanguageCode;

  String get selectedLanguageCode => _selectedLanguageCode;

  final _languages = ['en', 'az', 'ru'];

  List<Locale> _filterLocales(String languageCode) {
    return _languages
        .where((element) => element != languageCode)
        .map((e) => Locale(e))
        .toList();
  }

  // void changeLanguage(String languageCode) {
  //   debugPrint('languageCode: $languageCode');
  //   _selectedLanguageCode = languageCode;
  //   Intl.defaultLocale = _selectedLanguageCode;
  //   localizationDataSource.persistLocale(languageCode);
  //
  //   state = state.copyWith(
  //     locale: Locale(languageCode),
  //     otherLocales: _filterLocales(languageCode),
  //   );
  // }

  void changeLanguage(String languageCode) {
    _selectedLanguageCode = languageCode;
  }

  void resetSelection() {
    _selectedLanguageCode = state.locale.languageCode;
  }

  Future<void> apply() async {
    if (state.locale.languageCode == _selectedLanguageCode) return;

    try {
      await localizationDataSource.persistLocale(_selectedLanguageCode);
      Intl.defaultLocale = _selectedLanguageCode;

      state = state.copyWith(
        locale: Locale(selectedLanguageCode),
        // otherLocales: _filterLocales(languageCode),
      );
      // state = Locale(_selectedLanguageCode);
    } catch (_) {}
  }
}
