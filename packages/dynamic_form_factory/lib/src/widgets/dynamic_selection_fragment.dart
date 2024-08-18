import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../utils/app_bottom_sheet.dart';
import 'custom_radio.dart';

typedef SelectionItemBuilder = String Function(int index);

class DynamicSelectionFragment extends StatefulWidget {
  const DynamicSelectionFragment({
    super.key,
    required this.title,
    required this.itemBuilder,
    required this.count,
  });

  final String title;
  final SelectionItemBuilder itemBuilder;
  final int count;

  @override
  State<DynamicSelectionFragment> createState() =>
      _DynamicSelectionFragmentState();
}

class _DynamicSelectionFragmentState extends State<DynamicSelectionFragment>
    with AppBottomSheet {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeProvider.of(context);

    return super.buildSheet(
      context,
      title: widget.title,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final info = widget.itemBuilder(index);

                return Material(
                  key: ValueKey(info),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              info,
                              style: appTheme.typography.sp16.w400.copyWith(
                                color: appTheme.colors.onBackground,
                                height: 24 / 16,
                              ),
                            ),
                          ),
                          CustomRadio(selected: _selectedIndex == index),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.count,
            ),
          ),
        ],
      ),
    );
  }
}