library dynamic_form_factory;

import 'dart:io';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'src/app_input_field_interface.dart';
import 'src/fields/app_dropdown_field.dart';
import 'src/fields/app_text_field.dart';
import 'src/fields/attachment_picker_field.dart';
import 'src/fields/multi_user_picker_field.dart';

export 'src/app_input_field_interface.dart';
export 'src/utils/input_validators.dart';
export 'src/widgets/file_picker_view.dart';
export 'src/fields/app_text_field.dart';
export 'src/fields/attachment_picker_field.dart';
export 'src/fields/multi_user_picker_field.dart';
export 'src/widgets/attachment_picker_fragment.dart';

part 'src/field_configs.dart';

enum FieldType { text, dropdown, attachment, multiUserPicker }

typedef InputFieldBuilder<T> = IAppInputField<T> Function(
    FieldConfig<T> config);

class InputFieldFactory {
  const InputFieldFactory._(this.appTheme);
  final AppTheme appTheme;

  factory InputFieldFactory.initialize(BuildContext context) {
    return InputFieldFactory._(AppThemeProvider.of(context));
  }

  InputFieldBuilder build<T>(FieldType type) {
    switch (type) {
      case FieldType.text:
        return (config) {
          assert(config is TextConfig);
          return AppTextField(config: config as TextConfig);
        };
      case FieldType.dropdown:
        return (config) {
          assert(config is DropdownConfig<T>);
          return AppDropdownField<T>(config: config as DropdownConfig<T>);
        };
      case FieldType.attachment:
        return (config) {
          assert(config is FileConfig);
          return AttachmentPickerField(config: config as FileConfig);
        };
      case FieldType.multiUserPicker:
        return (_) {
          return MultiUserPickerField();
        };

      default:
        return (config) {
          return AppTextField(config: TextConfig());
        };
    }
  }
}