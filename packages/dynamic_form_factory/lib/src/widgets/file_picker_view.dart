import 'dart:io';

import 'package:app_theme/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dynamic_form_factory/src/fields/attachment_picker_field.dart';
import 'package:dynamic_form_factory/src/utils/app_bottom_sheet.dart';
import 'package:dynamic_form_factory/src/widgets/attachment_picker_fragment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef OnSelectionCompleted = void Function(List<PlatformFile> selectedFiles);
typedef OnFileDelete = void Function(int index);

class FilePickerView extends StatefulWidget {
  const FilePickerView({
    super.key,
    required this.title,
    required this.description,
    required this.filePickerResult,
    this.onSelectionCompleted,
    this.showValidationError = false,
    this.onFileDelete,
  });

  final String title;
  final String description;
  final ValueNotifier<List<File>?> filePickerResult;
  final OnSelectionCompleted? onSelectionCompleted;
  final bool showValidationError;
  final OnFileDelete? onFileDelete;

  @override
  State<FilePickerView> createState() => _FilePickerViewState();
}

class _FilePickerViewState extends State<FilePickerView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FilePickerPart(
          title: widget.title,
          description: widget.description,
          filePickerResult: widget.filePickerResult,
          showValidationError: widget.showValidationError,
        ),
        const SizedBox(height: 24),
        _SelectedFilesViewPart(
          filePickerResult: widget.filePickerResult,
          onFileDelete: widget.onFileDelete,
        ),
      ],
    );
  }
}

class _FilePickerPart extends StatelessWidget {
  const _FilePickerPart({
    Key? key,
    required this.title,
    required this.description,
    required this.showValidationError,
    required this.filePickerResult,
  }) : super(key: key);

  final String title;
  final String description;
  final bool showValidationError;
  final ValueNotifier<List<File>?> filePickerResult;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeProvider.of(context);

    return SizedBox(
      width: double.infinity,
      child: Material(
        color: showValidationError
            ? appTheme.colors.error.shade50
            : appTheme.colors.textColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            AppBottomSheet.show(
              context,
              AttachmentPickerFragment(
                fileNotifier: filePickerResult,
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(16),
            padding: EdgeInsets.zero,
            strokeWidth: 2,
            dashPattern: const [6, 8],
            strokeCap: StrokeCap.round,
            color: showValidationError
                ? appTheme.colors.error
                : appTheme.colors.textColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: showValidationError
                            ? appTheme.colors.error.shade100
                            : appTheme.colors.primaryButtonColor
                                .withOpacity(.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        'assets/upload.svg',
                        package: 'dynamic_form_factory',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: appTheme.typography.sp16.w500.copyWith(
                        color: appTheme.colors.onBackground,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: appTheme.typography.sp14.w400.copyWith(
                        color:
                            appTheme.colors.primaryButtonColor.withOpacity(.6),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectedFilesViewPart extends StatelessWidget {
  const _SelectedFilesViewPart({
    Key? key,
    required this.filePickerResult,
    this.onFileDelete,
  }) : super(key: key);

  final ValueNotifier<List<File>?> filePickerResult;
  final OnFileDelete? onFileDelete;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: filePickerResult,
      builder: (context, files, child) {
        if (files == null || files.isEmpty) {
          return const SizedBox.shrink();
        }

        final appTheme = AppThemeProvider.of(context);

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appTheme.colors.textColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final file = files[index];

              return _FileView(
                file: file,
                index: index,
                onFileDelete: onFileDelete,
              );
            },
            separatorBuilder: (_, __) {
              return Divider(
                height: 16,
                color: appTheme.colors.primaryButtonColor.withOpacity(.3),
              );
            },
            itemCount: files.length,
          ),
        );
      },
    );
  }
}

class _FileView extends StatelessWidget {
  const _FileView({
    required this.file,
    required this.index,
    this.onFileDelete,
  });

  final File file;
  final int index;
  final OnFileDelete? onFileDelete;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeProvider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: appTheme.colors.primaryButtonColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              'assets/document.svg',
              package: 'dynamic_form_factory',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              file.formattedPath ?? '',
              style: appTheme.typography.sp16.w400.copyWith(
                color: appTheme.colors.textColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () => onFileDelete?.call(index),
            child: SizedBox(
              child: SvgPicture.asset(
                'assets/delete.svg',
                package: 'dynamic_form_factory',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
