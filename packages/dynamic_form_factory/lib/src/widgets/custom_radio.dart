import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    this.selected = false,
  }) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeProvider.of(context);

    final color = selected
        ? appTheme.colors.primaryButtonColor
        : appTheme.colors.primaryButtonColor.withOpacity(.5);

    return Container(
      width: 20,
      height: 20,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: color,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
            )
          : null,
    );
  }
}
