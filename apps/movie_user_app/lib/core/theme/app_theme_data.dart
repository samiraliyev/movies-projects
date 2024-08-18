import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/assets.dart';

abstract class AppThemeData {
  static ThemeData dark(AppColorsData colors, AppTypographyData typography) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.background,
      fontFamily: Assets.fonts.roboto,
      buttonTheme: const ButtonThemeData(
        // buttonColor: colors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      // textTheme: TextTheme(
      //
      // ),
      // useMaterial3: true,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colors.textColor,
          // statusBarColor: Colors.red,
          systemNavigationBarColor: colors.whiteColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: typography.sp24.w500.copyWith(
          color: colors.textColor,
          fontFamily: Assets.fonts.ginoraSans,
        ),
        iconTheme: IconThemeData(
          color: colors.textColor,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: colors.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: colors.primaryButtonColor,
            disabledBackgroundColor: colors.primaryButtonColor.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size.fromHeight(66),
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            textStyle: typography.sp14.w500.copyWith(
              color: colors.primaryButtonTextColor,
            )),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith((states) {
            return typography.sp12.w500.copyWith(
              color: Color(colors.primaryButtonColor.value),
            );
          }),
          overlayColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.focused)) {
              return Colors.transparent;
            }
            if (states.contains(WidgetState.hovered)) {
              return Colors.transparent;
            }
            if (states.contains(WidgetState.pressed)) {
              return Colors.transparent;
            }
            return Colors.transparent; // Defer to the widget's default.
          }),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(colors.primaryButtonColor.value),
        extendedTextStyle: typography.sp14.w500.copyWith(
          color: colors.primaryButtonTextColor,
        ),
      ),

      popupMenuTheme: PopupMenuThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFF343C44),
          );
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        labelStyle: const TextStyle(
          color: Color(0xFF000000),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color(0xFFCCDFFB),
            width: 1,
          ),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: Colors.white,
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: typography.sp16.w400.copyWith(color: colors.inputHintColor),
        labelStyle: typography.sp16.w400.copyWith(color: colors.inputHintColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: colors.inputBorderColor,
        )),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: colors.inputBorderColor,
        )),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.inputFocusedBorderColor,
            // color: Color(colors.primaryButtonColor.value),
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primaryButtonColor;
          }
          return colors.bordersColor.withOpacity(.2);
        }),
        checkColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.transparent;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: colors.background,
        labelColor: colors.background,
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return colors.background;
          }
          return colors.background;
        }),
        unselectedLabelColor: colors.background.withOpacity(0.7),
        labelStyle: typography.sp14.w500,
        unselectedLabelStyle: typography.sp14.w400,
        dividerColor: Colors.transparent,
        // indicator: BoxDecoration(
        //   borderRadius: BorderRadius.circular(4),
        //   color: colors.primary,
        // ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      cardTheme: CardTheme(
        elevation: 1,
        color: colors.background,
        shadowColor: colors.bordersColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData light(AppColorsData colors, AppTypographyData typography) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.background,
      fontFamily: Assets.fonts.roboto,
      buttonTheme: const ButtonThemeData(
        // buttonColor: colors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      // textTheme: TextTheme(
      //
      // ),
      // useMaterial3: true,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colors.textColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: typography.sp24.w500.copyWith(
          color: colors.textColor,
          fontFamily: Assets.fonts.ginoraSans,
        ),
        iconTheme: IconThemeData(
          color: colors.primary.shade500,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: colors.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: colors.primaryButtonColor,
            disabledBackgroundColor: colors.primaryButtonColor.withOpacity(0.7),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size.fromHeight(66),
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            textStyle: typography.sp14.w500.copyWith(
              color: colors.primaryButtonTextColor,
            )),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith((states) {
            return typography.sp12.w500.copyWith(
              color: Color(colors.primaryButtonColor.value),
            );
          }),
          overlayColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.focused)) {
              return Colors.transparent;
            }
            if (states.contains(WidgetState.hovered)) {
              return Colors.transparent;
            }
            if (states.contains(WidgetState.pressed)) {
              return Colors.transparent;
            }
            return Colors.transparent; // Defer to the widget's default.
          }),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(colors.primaryButtonColor.value),
        extendedTextStyle: typography.sp14.w500.copyWith(
          color: colors.primaryButtonTextColor,
        ),
      ),

      popupMenuTheme: PopupMenuThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFF343C44),
          );
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        labelStyle: const TextStyle(
          color: Color(0xFF000000),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color(0xFFCCDFFB),
            width: 1,
          ),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: Colors.white,
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: typography.sp16.w400.copyWith(color: colors.inputHintColor),
        labelStyle: typography.sp16.w400.copyWith(color: colors.inputHintColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: colors.inputBorderColor,
        )),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: colors.inputBorderColor,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(colors.primaryButtonColor.value),
        )),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primaryButtonColor;
          }
          return colors.bordersColor.withOpacity(.2);
        }),
        checkColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.transparent;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: colors.background,
        labelColor: colors.background,
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return colors.background;
          }
          return colors.background;
        }),
        unselectedLabelColor: colors.background.withOpacity(0.7),
        labelStyle: typography.sp14.w500,
        unselectedLabelStyle: typography.sp14.w400,
        dividerColor: Colors.transparent,
        // indicator: BoxDecoration(
        //   borderRadius: BorderRadius.circular(4),
        //   color: colors.primary,
        // ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      cardTheme: CardTheme(
        elevation: 1,
        color: colors.background,
        shadowColor: colors.bordersColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
