import 'dart:io';

const _kDefaultRequiredMessage = 'Field is required!';

abstract class InputValidators {
  static String? requiredText(String? value, {String? requiredMessage}) {
    if (value == null || value.isEmpty) {
      return requiredMessage ?? _kDefaultRequiredMessage;
    }

    return null;
  }

  static String? requiredSelection<T>(List<T>? values,
      {String? requiredMessage}) {
    if (values == null || values.isEmpty) {
      return requiredMessage ?? _kDefaultRequiredMessage;
    }

    return null;
  }

  static String? requiredAttachment(List<File>? files,
      {String? requiredMessage}) {
    if (files == null || files.isEmpty) {
      return requiredMessage ?? _kDefaultRequiredMessage;
    }

    return null;
  }
}