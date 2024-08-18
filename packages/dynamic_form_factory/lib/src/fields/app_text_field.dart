import 'dart:developer';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../dynamic_form_factory.dart';
import '../utils/app_regex.dart';

class AppTextField<T> extends IAppInputField<String> {
  AppTextField({
    super.key,
    required final TextConfig config,
  }) : super(
          label: config.label,
          initialValue: config.controller != null
              ? config.controller?.text
              : config.initialValue ?? '',
          onSaved: config.onSaved,
          validator: config.validator,
          autoValidate: true,
          builder: (FormFieldState<String> state) {
            return Material(
              color: Colors.transparent,
              child: AppTextFormField(
                controller: config.controller,
                state: state,
                initialValue: config.initialValue,
                maxLines: config.maxLines,
                validator: config.validator,
                hintText: config.hint,
                labelText: config.label,
                maxLength: config.maxLength,
                prefixIcon: config.prefixIcon,
                defaultSuffixIcon: config.defaultSuffixIcon,
                secondarySuffixIcon: config.secondarySuffixIcon,
                obscureText: config.obscureText,
                borderWidth: config.borderWidth,
                borderRadius: config.borderRadius,
                formatters: config.formatters,
                focusNode: config.focusNode,
                onChanged: (value) {
                  state.didChange(value);
                },
                inputType: config.inputType,
              ),
            );
          },
        );
}

typedef SuffixIconBuilder = Widget Function(Color color);
typedef PrefixIconBuilder = Widget Function(Color color);

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    Key? key,
    required this.state,
    this.validator,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.defaultSuffixIcon,
    this.secondarySuffixIcon,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.denySpaces = false,
    this.onChanged,
    this.autofillHints,
    this.onEditingComplete,
    this.enabled = true,
    this.keyboardType,
    this.formatters,
    this.maxLength,
    this.initialValue,
    this.errorText,
    this.onSaved,
    this.inputType,
    this.controller,
    this.borderRadius,
    this.borderWidth,
    this.focusNode,
  })  : assert((obscureText && secondarySuffixIcon != null) ||
            (!obscureText && secondarySuffixIcon == null)),
        super(key: key);

  final FormFieldState<String> state;
  final String? hintText;
  final String? labelText;
  final PrefixIconBuilder? prefixIcon;
  final SuffixIconBuilder? defaultSuffixIcon;
  final SuffixIconBuilder? secondarySuffixIcon;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final bool denySpaces;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final bool enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final String? initialValue;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String?>? onSaved;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final double? borderRadius;
  final double? borderWidth;
  final FocusNode? focusNode;

  @override
  State<AppTextFormField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextFormField> {
  bool _hasError = false;
  bool _obscureText = false;
  bool _hasFocus = false;
  late final _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;

    _focusNode.addListener(_onFocusChange);
    widget.controller?.addListener(() {
      try {
        widget.state.didChange(widget.controller?.text);
      } catch (e) {
        // ignore: avoid_print
        log(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeProvider.of(context);
    final typography = appTheme.typography;
    final colors = appTheme.colors;

    final currentColor = _hasError ? colors.error : colors.primaryButtonColor;
    final currentIcon = _obscureText
        ? (widget.secondarySuffixIcon ?? widget.defaultSuffixIcon)
        : widget.defaultSuffixIcon;

    final normalBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      borderSide: BorderSide(
        width: widget.borderWidth ?? 2,
        color: colors.inputBorderColor,
      ),
    );

    final focusBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      borderSide: BorderSide(
        width: widget.borderWidth ?? 2,
        // color: colors.inputFocusedBorderColor,
        color: colors.inputFocusedBorderColor,
      ),
    );

    final errorBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      borderSide: BorderSide(
        width: widget.borderWidth ?? 2,
        color: colors.error.shade600,
      ),
    );

    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      focusNode: _focusNode,
      obscureText: _obscureText,
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.inputType,
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
      style: typography.sp16.copyWith(
        color: colors.textColor,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      ),
      onEditingComplete: widget.onEditingComplete,
      inputFormatters: [
        if (widget.denySpaces)
          FilteringTextInputFormatter.deny(
            AppRegex.blockSpace,
          ),
        ...?widget.formatters,
      ],
      autofillHints: widget.autofillHints,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        errorText: widget.errorText,
        filled: !widget.enabled,
        border: normalBorder,
        enabledBorder: normalBorder,
        focusedBorder: focusBorder,
        errorBorder: errorBorder,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
          maxWidth: 150,
          maxHeight: 40,
        ),
        suffixIcon: GestureDetector(
          // borderRadius: BorderRadius.circular(16),
          onTap: widget.secondarySuffixIcon != null
              ? () {
                  if (mounted) {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                }
              : null,
          child: currentIcon?.call(
            currentColor,
          ),
        ),
        prefixIcon: widget.prefixIcon?.call(
          currentColor,
        ),
        hintStyle: typography.sp17.w400.copyWith(
          color: colors.inputHintColor,
        ),
        hintText: widget.hintText,
        label: widget.labelText != null
            ? Text(
                widget.labelText!,
                style: typography.sp16.w400.copyWith(
                  color: _labelColor(colors),
                ),
              )
            : null,
      ),
      validator: (value) {
        final validatorResult = widget.validator?.call(value);
        final isValid = validatorResult == null;
        if (mounted) {
          setState(() {
            _hasError = !isValid;
          });
        }

        return validatorResult;
      },
    );
  }

  Color _labelColor(AppColorsData colors) {
    if (_hasError) {
      return colors.error;
    } else if (_hasFocus) {
      return colors.inputFocusedBorderColor;
    }

    return colors.inputHintColor;
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }
}
