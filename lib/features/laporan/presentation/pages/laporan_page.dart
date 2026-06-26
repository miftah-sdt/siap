import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:siap/core/services/download_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/features/laporan/domain/entities/laporan.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_bloc.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_event.dart';
import 'package:siap/features/laporan/presentation/bloc/laporan_state.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final _formKey = GlobalKey<FormState>();
  final _statusController = TextEditingController();
  final _dateFormat = DateFormat('dd MMM yyyy');

  LaporanType _selectedType = LaporanType.petani;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _statusController.dispose();
    super.dispose();
  }

  LaporanFilter _buildFilter() {
    return LaporanFilter(
      type: _selectedType,
      startDate: _startDate,
      endDate: _endDate,
      status: _statusController.text.trim().isEmpty
          ? null
          : _statusController.text.trim(),
    );
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initial = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = picked;
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _exportPdf() {
    if (!_formKey.currentState!.validate()) return;
    context.read<LaporanBloc>().add(
      LaporanEvent.exportPdf(filter: _buildFilter()),
    );
  }

  void _exportExcel() {
    if (!_formKey.currentState!.validate()) return;
    context.read<LaporanBloc>().add(
      LaporanEvent.exportExcel(filter: _buildFilter()),
    );
  }

  String? _validateDateRange() {
    if (_startDate != null &&
        _endDate != null &&
        _endDate!.isBefore(_startDate!)) {
      return 'Tanggal akhir tidak boleh sebelum tanggal awal';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LaporanBloc, LaporanState>(
        listener: (context, state) {
          if (state is LaporanSuccess) {
            UiFeedback.showSnackBar(
              context,
              message: 'Laporan berhasil diekspor: ${state.result.fileName}',
            );
            _showDownloadDialog(state.result);
          }
          if (state is LaporanError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LaporanLoading;

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Laporan',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Filter dan ekspor data ke PDF atau Excel.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  DropdownButtonFormField<LaporanType>(
                    value: _selectedType,
                    decoration: const InputDecoration(
                      labelText: 'Jenis Laporan',
                      prefixIcon: Icon(Icons.category_outlined),
                    ),
                    items: LaporanType.values
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.label),
                          ),
                        )
                        .toList(),
                    onChanged: isLoading
                        ? null
                        : (value) {
                            if (value != null) {
                              setState(() => _selectedType = value);
                            }
                          },
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: _DatePickerField(
                          label: 'Tanggal Awal',
                          formatted: _startDate != null
                              ? _dateFormat.format(_startDate!)
                              : null,
                          onTap: isLoading
                              ? null
                              : () => _pickDate(isStart: true),
                          onClear: isLoading
                              ? null
                              : () => setState(() => _startDate = null),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _DatePickerField(
                          label: 'Tanggal Akhir',
                          formatted: _endDate != null
                              ? _dateFormat.format(_endDate!)
                              : null,
                          onTap: isLoading
                              ? null
                              : () => _pickDate(isStart: false),
                          onClear: isLoading
                              ? null
                              : () => setState(() => _endDate = null),
                        ),
                      ),
                    ],
                  ),
                  if (_validateDateRange() != null)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.sm),
                      child: Text(
                        _validateDateRange()!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _statusController,
                    label: 'Status (opsional)',
                    hint: 'Contoh: aktif, pending',
                    enabled: !isLoading,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: 'Ekspor PDF',
                          icon: Icons.picture_as_pdf_outlined,
                          onPressed: isLoading ? null : _exportPdf,
                          isLoading: isLoading,
                          isExpanded: true,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: AppButton(
                          label: 'Ekspor Excel',
                          icon: Icons.table_chart_outlined,
                          variant: AppButtonVariant.secondary,
                          onPressed: isLoading ? null : _exportExcel,
                          isLoading: isLoading,
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showDownloadDialog(LaporanExportResult result) async {
    var isDownloading = false;
  double downloadProgress = 0;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          Future<void> download() async {
            setDialogState(() => isDownloading = true);
            try {
              final file = await sl<DownloadService>().downloadToDevice(
                url: result.downloadUrl,
                fileName: result.fileName,
                onProgress: (received, total) {
                  if (total > 0) {
                    setDialogState(() => downloadProgress = received / total);
                  }
                },
              );
              if (context.mounted) {
                Navigator.pop(context);
                await sl<DownloadService>().openFile(file);
                UiFeedback.showSnackBar(
                  this.context,
                  message: 'File disimpan: ${result.fileName}',
                );
              }
            } catch (e) {
              setDialogState(() => isDownloading = false);
              if (context.mounted) {
                UiFeedback.showSnackBar(
                  context,
                  message: e.toString(),
                  isError: true,
                );
              }
            }
          }

          return AlertDialog(
            title: const Text('Unduh Laporan'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('File: ${result.fileName}'),
                const SizedBox(height: AppSpacing.sm),
                SelectableText(result.downloadUrl),
                if (isDownloading) ...[
                  const SizedBox(height: AppSpacing.md),
                  LinearProgressIndicator(
                    value: downloadProgress > 0 ? downloadProgress : null,
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: isDownloading ? null : () => Navigator.pop(context),
                child: const Text('Tutup'),
              ),
              TextButton(
                onPressed: isDownloading
                    ? null
                    : () async {
                        await sl<DownloadService>().openInBrowser(
                          result.downloadUrl,
                        );
                      },
                child: const Text('Buka Browser'),
              ),
              FilledButton(
                onPressed: isDownloading ? null : download,
                child: Text(isDownloading ? 'Mengunduh...' : 'Unduh'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.formatted,
    required this.onTap,
    this.onClear,
  });

  final String label;
  final String? formatted;
  final VoidCallback? onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.calendar_today_outlined),
          suffixIcon: formatted != null && onClear != null
              ? IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  onPressed: onClear,
                )
              : null,
        ),
        child: Text(
          formatted ?? 'Pilih tanggal',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: formatted != null
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}
