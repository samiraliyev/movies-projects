import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDropdownButton extends StatelessWidget {
  const AppDropdownButton({
    super.key,
    required this.labelText,
    this.displayDropdownLabel = true,
    required this.hintText,
    this.invalid = false,
    this.errorText,
    this.onTap,
    this.suffixIconPath,
    this.inputColor,
  });

  final String? labelText;
  final bool displayDropdownLabel;
  final String? hintText;
  final VoidCallback? onTap;
  final bool invalid;
  final String? errorText;
  final String? suffixIconPath;
  final Color? inputColor;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeProvider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 6.w),
              child: Material(
                color: inputColor ?? appTheme.colors.background,
                borderRadius: BorderRadius.circular(4.w),
                borderOnForeground: true,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(4.w),
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: onTap != null
                            ? appTheme.colors.inputBorderColor
                            : appTheme.colors.inputBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: hintText != null && hintText!.isNotEmpty
                              ? Text(
                                  hintText!,
                                  style: appTheme.typography.sp16.w400.copyWith(
                                    color: onTap != null
                                        ? appTheme.colors.textColor
                                        : appTheme.colors.primaryButtonColor
                                            .withOpacity(0.6),
                                  ),
                                )
                              : labelText != null
                                  ? Text(
                                      labelText!,
                                      style: appTheme.typography.sp16.w400
                                          .copyWith(
                                        color: appTheme.colors.inputHintColor,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                        ),
                        SvgPicture.asset(
                          suffixIconPath ?? 'assets/icons/caret_down.svg',
                          colorFilter: ColorFilter.mode(
                            onTap != null
                                ? appTheme.colors.primaryButtonColor
                                : appTheme.colors.primaryButtonColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (displayDropdownLabel)
              Positioned(
                left: 16.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  color: appTheme.colors.background,
                  child: Text(
                    labelText ?? '',
                    style: appTheme.typography.sp12.w400.copyWith(
                      color: appTheme.colors.inputHintColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (invalid && errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              errorText!,
              style: appTheme.typography.sp16.w400.copyWith(
                color: appTheme.colors.error,
              ),
            ),
          ),
      ],
    );
  }
}
