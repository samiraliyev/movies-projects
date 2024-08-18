import 'package:dynamic_form_factory/dynamic_form_factory.dart';
import 'package:flutter/widgets.dart';

class MultiUserPickerField extends IAppInputField<String> {
  MultiUserPickerField({
    super.key,
  }) : super(
    label: '',
    initialValue: '',
    builder: (state) {
      return const SizedBox.shrink();
    },
  );
}