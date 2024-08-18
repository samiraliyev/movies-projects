import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

mixin AppBottomSheet {
  static Future<T?> show<T>(
    BuildContext context,
    Widget child, {
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      enableDrag: isDismissible,
      isDismissible: isDismissible,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child,
      ),
    );
  }

  Widget buildSheet(
    BuildContext context, {
    String? title,
    final String? description,
    final Widget? body,
    final List<Widget>? actions,
    Widget? titleSuffix,
    bool showCloseButton = true,
    bool controlScroll = true,
  }) {
    final appTheme = AppThemeProvider.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appTheme.colors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 3.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: appTheme.colors.inputBorderColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // if (showCloseButton)
          //   Padding(
          //     padding: const EdgeInsets.all(2),
          //     child: GestureDetector(
          //       onTap: Navigator.of(context).pop,
          //       child: Align(
          //         alignment: Alignment.topRight,
          //         child: Icon(
          //           Icons.cancel,
          //           color: appTheme.colors.primary.shade100,
          //         ),
          //       ),
          //     ),
          //   ),
          if (title != null) const SizedBox(height: 2),
          if (title != null)
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Center(
                      child: Text(
                        title,
                        style: appTheme.typography.sp16.w500.copyWith(
                          color: appTheme.colors.onBackground,
                        ),
                      ),
                    ),
                  ),
                  if (titleSuffix != null) ...[
                    const SizedBox(width: 8),
                    titleSuffix,
                  ],
                ],
              ),
            ),
          if (description != null) const SizedBox(height: 8),
          if (description != null)
            Text(
              description,
              style: appTheme.typography.sp14.w400.copyWith(
                color: appTheme.colors.primaryButtonColor,
              ),
            ),
          if (body != null)
            controlScroll
                ? Flexible(
                    child: SingleChildScrollView(
                      child: body,
                    ),
                  )
                : body,
          if (actions != null && actions.isNotEmpty)
            Column(
              children: actions,
            ),
        ],
      ),
    );
  }
}
