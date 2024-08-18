import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.isDark,
  });

  const ThemeState.initial() : isDark = true;

  final bool isDark;

  // copyWith
  ThemeState copyWith({
    bool? isDark,
    List<Locale>? otherLocales,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
    );
  }

  @override
  List<Object?> get props => [isDark];
}
