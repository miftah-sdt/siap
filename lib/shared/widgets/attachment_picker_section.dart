import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:siap/core/services/media_picker_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/app_button.dart';

class AttachmentPickerSection extends StatefulWidget {
  const AttachmentPickerSection({
    super.key,
    required this.title,
    required this.attachments,
    required this.onChanged,
    this.enableCamera = true,
    this.hint,
  });

  final String title;
  final List<String> attachments;
  final ValueChanged<List<String>> onChanged;
  final bool enableCamera;
  final String? hint;

  @override
  State<AttachmentPickerSection> createState() =>
      _AttachmentPickerSectionState();
}

class _AttachmentPickerSectionState extends State<AttachmentPickerSection> {
  bool _isUploading = false;
  double _progress = 0;

  MediaPickerService get _media => sl<MediaPickerService>();

  Future<void> _pickAndUpload(Future<File?> Function() picker) async {
    if (_isUploading) return;

    final online = await _media.hasConnection();
    if (!online && mounted) {
      UiFeedback.showSnackBar(
        context,
        message: 'Tidak ada koneksi internet untuk upload.',
        isError: true,
      );
      return;
    }

    final file = await picker();
    if (file == null || !mounted) return;

    setState(() {
      _isUploading = true;
      _progress = 0;
    });

    try {
      final uploaded = await _media.upload(
        file,
        onProgress: (sent, total) {
          if (total > 0 && mounted) {
            setState(() => _progress = sent / total);
          }
        },
      );
      widget.onChanged([...widget.attachments, uploaded.url]);
      if (mounted) {
        UiFeedback.showSnackBar(
          context,
          message: '${uploaded.originalName} berhasil diunggah.',
        );
      }
    } catch (e) {
      if (mounted) {
        UiFeedback.showSnackBar(
          context,
          message: e.toString(),
          isError: true,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
          _progress = 0;
        });
      }
    }
  }

  void _remove(int index) {
    final updated = [...widget.attachments]..removeAt(index);
    widget.onChanged(updated);
  }

  String _labelFor(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return url;
    final segment = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : url;
    return Uri.decodeComponent(segment);
  }

  bool _isImageUrl(String url) {
    final lower = url.toLowerCase();
    return lower.contains('.jpg') ||
        lower.contains('.jpeg') ||
        lower.contains('.png') ||
        lower.contains('.gif') ||
        lower.contains('.webp');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
        if (widget.hint != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.hint!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            if (widget.enableCamera)
              AppButton(
                label: 'Kamera',
                icon: Icons.camera_alt_outlined,
                variant: AppButtonVariant.secondary,
                onPressed: _isUploading
                    ? null
                    : () => _pickAndUpload(_media.pickFromCamera),
              ),
            AppButton(
              label: 'Galeri',
              icon: Icons.photo_library_outlined,
              variant: AppButtonVariant.secondary,
              onPressed: _isUploading
                  ? null
                  : () => _pickAndUpload(_media.pickFromGallery),
            ),
            AppButton(
              label: 'File',
              icon: Icons.attach_file,
              variant: AppButtonVariant.secondary,
              onPressed: _isUploading
                  ? null
                  : () => _pickAndUpload(_media.pickDocument),
            ),
          ],
        ),
        if (_isUploading) ...[
          const SizedBox(height: AppSpacing.sm),
          LinearProgressIndicator(value: _progress > 0 ? _progress : null),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Mengunggah... ${(_progress * 100).toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        if (widget.attachments.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          ...List.generate(widget.attachments.length, (index) {
            final url = widget.attachments[index];
            final isImage = _isImageUrl(url);
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: ListTile(
                leading: isImage
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          imageUrl: url,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => const SizedBox(
                            width: 48,
                            height: 48,
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                          errorWidget: (_, __, ___) =>
                              const Icon(Icons.broken_image_outlined),
                        ),
                      )
                    : Icon(
                        url.toLowerCase().contains('.pdf')
                            ? Icons.picture_as_pdf_outlined
                            : Icons.description_outlined,
                      ),
                title: Text(
                  _labelFor(url),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  isImage ? 'Gambar' : 'Dokumen',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _isUploading ? null : () => _remove(index),
                ),
              ),
            );
          }),
        ],
      ],
    );
  }
}
