import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class LocalizationState extends Equatable {
  const LocalizationState({
    required this.locale,
    required this.otherLocales,
  });

  const LocalizationState.initial()
      : locale = const Locale('az'),
        otherLocales = const [Locale('az'), Locale('ru')];

  final Locale locale;
  final List<Locale> otherLocales;

  // copyWith
  LocalizationState copyWith({
    Locale? locale,
    List<Locale>? otherLocales,
  }) {
    return LocalizationState(
      locale: locale ?? this.locale,
      otherLocales: otherLocales ?? this.otherLocales,
    );
  }

  @override
  List<Object?> get props => [locale, otherLocales];
}
