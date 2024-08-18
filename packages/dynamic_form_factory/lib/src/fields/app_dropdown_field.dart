import 'package:app_theme/app_theme.dart';
import 'package:dynamic_form_factory/dynamic_form_factory.dart';
import 'package:dynamic_form_factory/src/utils/app_bottom_sheet.dart';
import 'package:dynamic_form_factory/src/widgets/app_dropdown_button.dart';
import 'package:dynamic_form_factory/src/widgets/custom_radio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Selection<T> extends Equatable {
  const Selection({
    required this.value,
    this.selected = false,
  });

  final T value;
  final bool selected;

  Selection<T> copyWith({
    T? value,
    bool? selected,
  }) {
    return Selection(
      value: value ?? this.value,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [value, selected];
}

class AppDropdownField<T> extends IAppInputField<List<T>> {
  AppDropdownField({
    super.key,
    required this.config,
  }) : super(
          label: config.label,
          initialValue: config.initialValue,
          onSaved: config.onSaved,
          validator: config.validator,
          builder: (FormFieldState<List<T>> state) {
            final context = state.context;
            final internalState = state as _AppDropdownFieldState<T>;

            return AppDropdownButton(
              labelText: config.label,
              hintText: internalState._values ?? config.label,
              invalid: state.hasError,
              errorText: state.errorText,
              suffixIconPath: config.suffixIconPath,
              displayDropdownLabel: config.displayDropdownLabel,
              inputColor: config.inputColor,
              onTap: () async {
                AppBottomSheet.show(
                  context,
                  DynamicChoiceView(
                    title: config.label ?? '',
                    items: internalState._selections,
                    allowMultiChoice: config.allowMultiChoice,
                    itemLabelBuilder: config.itemLabelBuilder,
                  ),
                );
              },
            );
          },
        );

  final DropdownConfig<T> config;

  @override
  FormFieldState<List<T>> createState() => _AppDropdownFieldState<T>();
}

class _AppDropdownFieldState<T> extends FormFieldState<List<T>> {
  final _selections = ValueNotifier(<Selection<T>>[]);
  String? _values;

  @override
  void initState() {
    super.initState();

    _selections.addListener(
      () {
        final selections = _selections.value;

        final labelBuffer = StringBuffer();
        bool firstSelection = true;
        final currentSelectedItems = <T>[];

        for (int i = 0; i < selections.length; i++) {
          if (selections[i].selected) {
            String prefix = firstSelection ? '' : ', ';
            labelBuffer.write('$prefix${widget.config.itemLabelBuilder(i)}');
            firstSelection = false;
            currentSelectedItems.add(selections[i].value);
          }
        }

        _values = labelBuffer.toString();
        labelBuffer.clear();
        didChange(currentSelectedItems);
        validate();
        save();
      },
    );

    _initialize();
  }

  void _initialize() {
    final options = widget.config.options;
    final initials = widget.config.initialValue;

    if (initials == null) {
      _selections.value.addAll(options.map((e) => Selection<T>(value: e)));
      return;
    }

    final labelBuffer = StringBuffer();
    bool firstSelection = true;
    for (int i = 0; i < options.length; i++) {
      var selected = false;
      final selection = Selection<T>(value: options[i]);

      for (int j = 0; j < initials.length; j++) {
        if (options[i] == initials[j]) {
          selected = true;
          break;
        }
      }

      if (selected) {
        String prefix = firstSelection ? '' : ', ';
        labelBuffer.write('$prefix${widget.config.itemLabelBuilder(i)}');
        firstSelection = false;
      }

      _selections.value.add(selection.copyWith(selected: selected));
    }

    _values = labelBuffer.toString();
    labelBuffer.clear();
  }

  @override
  AppDropdownField<T> get widget => super.widget as AppDropdownField<T>;
}

typedef ItemLabelBuilder = String Function(int index);

class DynamicChoiceView<T> extends StatelessWidget with AppBottomSheet {
  const DynamicChoiceView({
    super.key,
    required this.title,
    required this.items,
    required this.itemLabelBuilder,
    required this.allowMultiChoice,
  });

  final String title;
  final ValueNotifier<List<Selection<T>>> items;
  final ItemLabelBuilder itemLabelBuilder;
  final bool allowMultiChoice;

  @override
  Widget build(BuildContext context) {
    return super.buildSheet(
      context,
      title: title,
      controlScroll: false,
      body: Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade100,
              ),
            ),
          ),
          margin: EdgeInsets.only(
            top: 16.h,
            bottom: 16.h,
          ),
          padding: const EdgeInsets.only(
            top: 24,
          ),
          child: ValueListenableBuilder(
            valueListenable: items,
            builder: (context, currentSelections, child) {
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      final currentItem = currentSelections[index];
                      var currentItems = currentSelections;

                      if (!allowMultiChoice) {
                        currentItems = currentItems
                            .map((e) => e.copyWith(selected: false))
                            .toList();
                      }

                      currentItems[index] = currentItem.copyWith(
                        selected: !currentItem.selected,
                      );

                      items.value = [...currentItems];
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              itemLabelBuilder(index),
                            ),
                          ),
                          Center(
                            child: CustomRadio(
                                selected: currentSelections[index].selected),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: currentSelections.length,
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 8);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
