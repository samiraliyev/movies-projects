import 'package:flutter/material.dart';

abstract class IAppInputField<T> extends FormField<T> {
  const IAppInputField({
    super.key,
    required final FormFieldBuilder<T> builder,
    String? label,
    T? initialValue,
    FormFieldSetter<T?>? onSaved,
    FormFieldValidator<T?>? validator,
    bool autoValidate = false,
    final VoidCallback? onTap,
  }) : super(
    initialValue: initialValue,
    onSaved: onSaved,
    validator: validator,
    autovalidateMode: autoValidate
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled,
    builder: builder,
  );
}