import 'dart:io';

import 'package:app_theme/app_theme.dart';
import 'package:dynamic_form_factory/src/utils/app_bottom_sheet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AttachmentPickerFragment extends StatefulWidget {
  const AttachmentPickerFragment({
    super.key,
    required this.fileNotifier,
  });

  final ValueNotifier<List<File>?> fileNotifier;

  @override
  State<AttachmentPickerFragment> createState() =>
      _AttachmentPickerFragmentState();
}

class _AttachmentPickerFragmentState extends State<AttachmentPickerFragment>
    with AppBottomSheet {
  @override
  Widget build(BuildContext context) {
    return super.buildSheet(
      context,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(
            context,
            iconPath: 'assets/gallery.svg',
            title: 'Choose from gallery',
            onTap: () => _pick(context, fileType: FileType.image),
          ),
          _buildRow(
            context,
            iconPath: 'assets/file_manager.svg',
            title: 'Choose from file manager',
            onTap: () => _pick(context, fileType: FileType.any),
          ),
          _buildRow(
            context,
            iconPath: 'assets/take_photo.svg',
            title: 'Take a new photo',
            onTap: _takePhoto,
          ),
        ],
      ),
    );
  }

  void _pick(
      BuildContext context, {
        required FileType fileType,
      }) async {
    try {
      Navigator.of(context).pop();
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: fileType,
      );

      if (result != null && result.files.isNotEmpty) {
        final allFiles = widget.fileNotifier.value ?? [];

        for (int i = 0; i < result.files.length; i++) {
          final file = File(result.files[i].path!);

          int sizeInBytes = file.lengthSync();
          double sizeInMb = sizeInBytes / (1024 * 1024);
          if (sizeInMb > 10 && mounted) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  content: Text(
                    'File size is larger than 10 MB',
                  ),
                ),
              );
          } else {
            allFiles.add(file);
          }
        }

        widget.fileNotifier.value = [...allFiles];
      }
    } catch (_) {}
  }

  void _takePhoto() async {
    try {
      Navigator.of(context).pop();
      final picker = ImagePicker();
      final photo = await picker.pickImage(source: ImageSource.camera);

      if (photo == null) return;

      final allFiles = widget.fileNotifier.value ?? [];
      allFiles.add(File(photo.path));
      widget.fileNotifier.value = [...allFiles];
    } catch (_) {}
  }

  Widget _buildRow(
      BuildContext context, {
        required iconPath,
        required String title,
        VoidCallback? onTap,
      }) {
    final appTheme = AppThemeProvider.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 18,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              package: 'dynamic_form_factory',
            ),
            const SizedBox(width: 18),
            Text(
              title,
              style: appTheme.typography.sp16.w400.copyWith(
                color: appTheme.colors.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}