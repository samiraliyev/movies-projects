part of '../dynamic_form_factory.dart';

class FieldConfig<T> {
  FieldConfig({
    this.label,
    this.hint,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.inputColor,
  });

  final String? label;
  final String? hint;
  final T? initialValue;
  final FormFieldValidator<T?>? validator;
  final FormFieldSetter<T?>? onSaved;
  final Color? inputColor;

  FieldConfig<T> copyWith({
    final String? label,
    final T? initialValue,
    final FormFieldValidator<T?>? validator,
    final FormFieldSetter<T?>? onSaved,
    final Color? inputColor,
  }) {
    return FieldConfig(
      label: label ?? this.label,
      initialValue: initialValue ?? this.initialValue,
      validator: validator ?? this.validator,
      onSaved: onSaved ?? this.onSaved,
      inputColor: inputColor ?? this.inputColor,
    );
  }
}

class TextConfig extends FieldConfig<String> {
  TextConfig({
    super.label,
    super.inputColor,
    super.hint,
    super.initialValue,
    super.validator,
    super.onSaved,
    this.maxLines,
    this.inputType,
    this.maxLength,
    this.prefixIcon,
    this.defaultSuffixIcon,
    this.secondarySuffixIcon,
    this.obscureText = false,
    this.controller,
    this.borderRadius = 0,
    this.borderWidth = 2,
    this.formatters,
    this.focusNode,
  });

  final int? maxLines;
  final TextInputType? inputType;
  final int? maxLength;
  final PrefixIconBuilder? prefixIcon;
  final SuffixIconBuilder? defaultSuffixIcon;
  final SuffixIconBuilder? secondarySuffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final double borderRadius;
  final double borderWidth;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? formatters;

  @override
  TextConfig copyWith(
      {final String? label,
      final Color? inputColor,
      final String? hint,
      final String? initialValue,
      final FormFieldValidator<String?>? validator,
      final FormFieldSetter<String?>? onSaved,
      final int? maxLines,
      final TextInputType? inputType,
      final PrefixIconBuilder? prefixIcon,
      final SuffixIconBuilder? defaultSuffixIcon,
      final SuffixIconBuilder? secondarySuffixIcon,
      final bool? obscureText,
      final TextEditingController? controller,
      final double? borderRadius,
      final double? borderWidth,
      final FocusNode? focusNode,
      final List<TextInputFormatter>? formatters,
      f}) {
    return TextConfig(
      label: label ?? this.label,
      inputColor: inputColor ?? this.inputColor,
      hint: hint ?? this.hint,
      initialValue: initialValue ?? this.initialValue,
      validator: validator ?? this.validator,
      onSaved: onSaved ?? this.onSaved,
      maxLines: maxLines ?? this.maxLines,
      inputType: inputType ?? this.inputType,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      defaultSuffixIcon: defaultSuffixIcon ?? this.defaultSuffixIcon,
      secondarySuffixIcon: secondarySuffixIcon ?? this.secondarySuffixIcon,
      obscureText: obscureText ?? this.obscureText,
      controller: controller ?? this.controller,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      formatters: formatters ?? this.formatters,
    );
  }
}

class DropdownConfig<T> extends FieldConfig<List<T>> {
  DropdownConfig({
    required this.options,
    required this.itemLabelBuilder,
    super.label,
    super.initialValue,
    super.onSaved,
    super.validator,
    super.inputColor,
    this.allowMultiChoice = false,
    this.suffixIconPath,
    this.displayDropdownLabel = true,
  });

  final List<T> options;
  final ItemLabelBuilder itemLabelBuilder;
  final bool allowMultiChoice;
  final String? suffixIconPath;
  final bool displayDropdownLabel;
}

class FileConfig extends FieldConfig<List<File>> {
  FileConfig({
    super.label,
    super.initialValue,
    super.onSaved,
    super.validator,
    this.description,
  });

  final String? description;
}

class MultiUserPickerConfig extends FieldConfig<Map<String, String>> {
  MultiUserPickerConfig({
    super.label,
    super.initialValue,
    super.onSaved,
    super.validator,
  });
}
