import 'package:app_theme/src/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum UserColorType {
  main(
      primary: MaterialColor(
    0xFF335683,
    <int, Color>{
      50: Color(0xFFE4F3FF),
      100: Color(0xFFBEE1FF),
      200: Color(0xFFF0F5F7),
      300: Color(0xFFBEE1FF),
      400: Color(0xFFBEE1FF),
      500: Color(0xFF335683),
      600: Color(0xFF328DFF),
      700: Color(0xFF347AF6),
      900: Color(0xFF3547C4)
    },
  ));

  // can use named parameters if you want
  const UserColorType({required this.primary});

  final MaterialColor primary;
}

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.whiteColor,
    required this.blackColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.bordersColor,
    required this.primary,
    required this.secondaryColor,
    required this.error,
    required this.greenColor,
    required this.redColor,
    required this.onBackground,
    required this.background,
    required this.itemBackground,
    required this.gradientColorSecondary,
    required this.transactionPrimaryColor,
    required this.transactionSecondaryColor,
    required this.primaryButtonColor,
    required this.primaryButtonTextColor,
    required this.secondaryButtonColor,
    required this.secondaryButtonTextColor,
    required this.inputBorderColor,
    required this.inputLabelColor,
    required this.inputHintColor,
    required this.searchInputHintColor,
    required this.pinBorderColor,
    required this.inputFocusedBorderColor,
    required this.shadowColor,
    required this.highlightTextColor,
    required this.backgroundMainGradientColor,
    required this.gradientBlueFirstColor,
    required this.gradientBlueSecondColor,
    required this.gradientPurpleFirstColor,
    required this.gradientPurpleSecondColor,
    required this.gradientDarkFirstColor,
    required this.gradientDarkSecondColor,
  });

  final Color whiteColor;
  final Color blackColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color bordersColor;
  final MaterialColor primary;
  final MaterialColor secondaryColor;
  final MaterialColor error;
  final MaterialColor greenColor;
  final MaterialColor redColor;
  final Color onBackground;
  final Color background;
  final Color itemBackground;
  final Color gradientColorSecondary;
  final Color transactionPrimaryColor;
  final Color transactionSecondaryColor;
  final Color primaryButtonColor;
  final Color primaryButtonTextColor;
  final Color secondaryButtonColor;
  final Color secondaryButtonTextColor;

  final Color inputBorderColor;
  final Color inputFocusedBorderColor;
  final Color inputLabelColor;
  final Color inputHintColor;

  final Color searchInputHintColor;

  final Color pinBorderColor;

  final Color shadowColor;

  final Color highlightTextColor;
  final Color backgroundMainGradientColor;

  final Color gradientBlueFirstColor;
  final Color gradientBlueSecondColor;

  final Color gradientPurpleFirstColor;
  final Color gradientPurpleSecondColor;

  final Color gradientDarkFirstColor;
  final Color gradientDarkSecondColor;

  factory AppColorsData.dark({
    UserColorType userColorType = UserColorType.main,
  }) =>
      AppColorsData(
        whiteColor: const Color(0xFFFFFFFF),
        blackColor: const Color(0xFF000000),
        textColor: const Color(0xFFFFFFFF),
        secondaryTextColor: const Color(0xFFFAFAFA).withOpacity(0.4),
        bordersColor: const Color(0xFF333333),
        primary: const MaterialColor(
          0xFF008994,
          <int, Color>{
            50: Color(0xFFC2FDFF),
            100: Color(0xFFA3E5E9),
            200: Color(0xFF81CAD1),
            300: Color(0xFF5AAFB8),
            400: Color(0xFF009EA8),
            500: Color(0xFF008994),
            600: Color(0xFF007983),
            700: Color(0xFF00646D),
            800: Color(0xFF005059),
            900: Color(0xFF003B43),
          },
        ),
        secondaryColor: const MaterialColor(
          0xFF8DC63F,
          <int, Color>{
            50: Color(0xFFF1FDE3),
            100: Color(0xFFDDF2C2),
            200: Color(0xFFC5E49E),
            300: Color(0xFFAFD979),
            400: Color(0xFF9FCF5C),
            500: Color(0xFF8DC63F),
            600: Color(0xFF7CB536),
            700: Color(0xFF6AA22D),
            800: Color(0xFF578F26),
            900: Color(0xFF326D15),
            // Custom shades
            1000: Color(0xFFD1FF88),
            1100: Color(0xFFB6FF4D),
            1200: Color(0xFF78FF00),
            1300: Color(0xFF69E000),
          },
        ),
        error: const MaterialColor(
          0xFFE8513A,
          <int, Color>{
            50: Color(0xFFFDECEE),
            100: Color(0xFFFBCED2),
            500: Color(0xFFE8513A),
            600: Color(0xFFDE3C4B),
            900: Color(0xFFAA3122),
          },
        ),
        redColor: const MaterialColor(
          0xFFFF3A3A,
          <int, Color>{
            50: Color(0xFFFDECEE),
            100: Color(0xFFFBCED2),
            500: Color(0xFFE8513A),
            600: Color(0xFFFF3A3A),
            700: Color(0xFFDE3C4B),
            900: Color(0xFFAA3122),
          },
        ),
        greenColor: const MaterialColor(
          0xFF1B998B,
          <int, Color>{
            100: Color(0xFFDAEFED),
            500: Color(0xFF1B998B),
          },
        ),
        onBackground: const Color(0xFFFFFFFF),
        background: const Color(0xFF1D1D1D),
        itemBackground: const Color(0xFF292929),
        gradientColorSecondary: const Color(0xFF79B1F8).withOpacity(0.26),
        transactionPrimaryColor: const Color(0xFF000000),
        transactionSecondaryColor: const Color(0xFF3C4A54),
        primaryButtonColor: const Color(0xFF335683),
        primaryButtonTextColor: const Color(0xFFFFFFFF),
        secondaryButtonColor: const Color(0xFFF0F5F7),
        secondaryButtonTextColor: const Color.fromRGBO(0, 0, 0, 0.6),
        inputBorderColor: const Color(0xFF38383A),
        inputFocusedBorderColor: const Color(0xFF335683),
        inputLabelColor: const Color.fromRGBO(0, 0, 0, 0.6),
        inputHintColor: const Color(0x99EBEBF5),
        searchInputHintColor: const Color.fromRGBO(0, 0, 0, 0.60),
        pinBorderColor: const Color(0xFFDADADA),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.10),
        highlightTextColor: const Color(0xFF6FD2DE),
        backgroundMainGradientColor: const Color(0xFF292929),
        gradientBlueFirstColor: const Color(0xFF5CE4CF),
        gradientBlueSecondColor: const Color(0xFF99A9FF),
        gradientPurpleFirstColor: const Color(0xFFFF9898),
        gradientPurpleSecondColor: const Color(0xFF8054FF),
        gradientDarkFirstColor: const Color(0xFF1D1D1D),
        gradientDarkSecondColor: const Color(0xFF79B1F8),
      );

  factory AppColorsData.light({
    UserColorType userColorType = UserColorType.main,
  }) =>
      AppColorsData(
        whiteColor: const Color(0xFFFFFFFF),
        blackColor: const Color(0xFF000000),
        textColor: const Color(0xFF000000),
        // secondaryTextColor: const Color(0xFFB8B8B8),
        secondaryTextColor: const Color(0xFF000000).withOpacity(0.58),
        bordersColor: const Color(0xFF333333),
        primary: const MaterialColor(
          0xFF008994,
          <int, Color>{
            50: Color(0xFFC2FDFF),
            100: Color(0xFFA3E5E9),
            200: Color(0xFF81CAD1),
            300: Color(0xFF5AAFB8),
            400: Color(0xFF009EA8),
            500: Color(0xFF008994),
            600: Color(0xFF007983),
            700: Color(0xFF00646D),
            800: Color(0xFF005059),
            900: Color(0xFF003B43),
          },
        ),
        secondaryColor: const MaterialColor(
          0xFF8DC63F,
          <int, Color>{
            50: Color(0xFFF1FDE3),
            100: Color(0xFFDDF2C2),
            200: Color(0xFFC5E49E),
            300: Color(0xFFAFD979),
            400: Color(0xFF9FCF5C),
            500: Color(0xFF8DC63F),
            600: Color(0xFF7CB536),
            700: Color(0xFF6AA22D),
            800: Color(0xFF578F26),
            900: Color(0xFF326D15),
            // Custom shades
            1000: Color(0xFFD1FF88),
            1100: Color(0xFFB6FF4D),
            1200: Color(0xFF78FF00),
            1300: Color(0xFF69E000),
          },
        ),
        error: const MaterialColor(
          0xFFE8513A,
          <int, Color>{
            50: Color(0xFFFDECEE),
            100: Color(0xFFFBCED2),
            500: Color(0xFFE8513A),
            600: Color(0xFFDE3C4B),
            900: Color(0xFFAA3122),
          },
        ),
        redColor: const MaterialColor(
          0xFFFF3A3A,
          <int, Color>{
            50: Color(0xFFFDECEE),
            100: Color(0xFFFBCED2),
            500: Color(0xFFE8513A),
            600: Color(0xFFFF3A3A),
            700: Color(0xFFDE3C4B),
            900: Color(0xFFAA3122),
          },
        ),
        greenColor: const MaterialColor(
          0xFF1B998B,
          <int, Color>{
            100: Color(0xFFDAEFED),
            500: Color(0xFF1B998B),
          },
        ),
        onBackground: const Color(0xFFFFFFFF),
        background: const Color(0xFFF6F7FB),
        itemBackground: const Color(0xFFFFFFFF),
        gradientColorSecondary: const Color(0xFF79B1F8).withOpacity(0.26),
        transactionPrimaryColor: const Color(0xFF000000),
        transactionSecondaryColor: const Color(0xFF3C4A54),
        primaryButtonColor: const Color(0xFF335683),
        primaryButtonTextColor: const Color(0xFFFFFFFF),
        secondaryButtonColor: const Color(0xFFF0F5F7),
        secondaryButtonTextColor: const Color.fromRGBO(0, 0, 0, 0.6),
        inputBorderColor: const Color.fromRGBO(0, 0, 0, 0.20),
        inputFocusedBorderColor: const Color.fromRGBO(0, 0, 0, 0.40),
        inputLabelColor: const Color.fromRGBO(0, 0, 0, 0.6),
        inputHintColor: const Color.fromRGBO(0, 0, 0, 0.30),
        searchInputHintColor: const Color.fromRGBO(0, 0, 0, 0.60),
        pinBorderColor: const Color(0xFFDADADA),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.10),
        highlightTextColor: const Color(0xFF6FD2DE),
        backgroundMainGradientColor: const Color(0xFF292929),
        gradientBlueFirstColor: const Color(0xFF5CE4CF),
        gradientBlueSecondColor: const Color(0xFF99A9FF),
        gradientPurpleFirstColor: const Color(0xFFFF9898),
        gradientPurpleSecondColor: const Color(0xFF8054FF),
        gradientDarkFirstColor: const Color(0xFF1D1D1D),
        gradientDarkSecondColor: const Color(0xFF79B1F8),
      );

  @override
  List<Object?> get props => [
        textColor.named('textColor'),
        secondaryTextColor.named('secondaryTextColor'),
        bordersColor.named('bordersColor'),
        error.named('error'),
        greenColor.named('greenColor'),
        redColor.named('redColor'),
        onBackground.named('onBackground'),
        background.named('background'),
        itemBackground.named('itemBackground'),
        gradientColorSecondary.named('gradientColorSecondary'),
        transactionPrimaryColor.named('transactionPrimaryColor'),
        transactionSecondaryColor.named('transactionSecondaryColor'),
        primaryButtonColor.named('primaryButtonColor'),
        primaryButtonTextColor.named('primaryButtonTextColor'),
        secondaryButtonColor.named('secondaryButtonColor'),
        secondaryButtonTextColor.named('secondaryButtonTextColor'),
        inputBorderColor.named('inputBorderColor'),
        inputFocusedBorderColor.named('inputFocusedBorderColor'),
        inputLabelColor.named('inputLabelColor'),
        inputHintColor.named('inputHintColor'),
        searchInputHintColor.named('searchInputHintColor'),
        pinBorderColor.named('pinBorderColor'),
        shadowColor.named('shadowColor'),
        highlightTextColor.named('highlightTextColor'),
        backgroundMainGradientColor.named('backgroundMainGradientColor'),
      ];
}
