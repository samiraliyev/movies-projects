import 'dart:io';

import 'package:flutter/material.dart';

import '../../dynamic_form_factory.dart';

class AttachmentPickerField extends IAppInputField<List<File>> {
  AttachmentPickerField({
    super.key,
    final FileConfig? config,
  }) : super(
    label: config?.label,
    initialValue: config?.initialValue,
    onSaved: config?.onSaved,
    validator: config?.validator,
    builder: (FormFieldState<List<File>> state) {
      final interalState = state as _AppFilePickerFieldState;
      final pickedFile = interalState._pickedFile;

      return FilePickerView(
        title: config?.label ?? 'Add Attachment',
        description: config?.description ?? '',
        filePickerResult: pickedFile,
        showValidationError: state.hasError,
        onFileDelete: interalState._deleteAt,
      );
    },
  );

  @override
  FormFieldState<List<File>> createState() => _AppFilePickerFieldState();
}

class _AppFilePickerFieldState extends FormFieldState<List<File>> {
  final _pickedFile = ValueNotifier<List<File>?>(null);

  @override
  void initState() {
    super.initState();

    _pickedFile.addListener(
          () {
        didChange(_pickedFile.value);
        validate();
        save();
      },
    );
  }

  @override
  void reset() {
    super.reset();

    _pickedFile.value = null;
    didChange(null);
    validate();
  }

  void _deleteAt(int index) {
    final allFiles = _pickedFile.value;
    if (allFiles == null || allFiles.isEmpty) return;
    allFiles.removeAt(index);
    _pickedFile.value = [...allFiles];
  }

  @override
  FormField<List<File>> get widget => super.widget as AttachmentPickerField;
}

extension PathExtractor on File {
  String? get formattedPath => path.split('/').last;
}