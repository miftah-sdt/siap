import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/core/services/location_service.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/utils/validators.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_form_bloc.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_form_event.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_form_state.dart';
import 'package:siap/injection/dependency_injection.dart';
import 'package:siap/shared/widgets/app_button.dart';
import 'package:siap/shared/widgets/app_text_field.dart';

class LahanFormPage extends StatefulWidget {
  const LahanFormPage({super.key, this.lahan});

  final Lahan? lahan;

  @override
  State<LahanFormPage> createState() => _LahanFormPageState();
}

class _LahanFormPageState extends State<LahanFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _kodeController;
  late final TextEditingController _namaController;
  late final TextEditingController _luasController;
  late final TextEditingController _lokasiController;
  late final TextEditingController _koordinatController;
  bool _isFetchingGps = false;

  Future<void> _fetchGps() async {
    setState(() => _isFetchingGps = true);
    try {
      final position = await sl<LocationService>().getCurrentPosition();
      _koordinatController.text = sl<LocationService>().formatCoordinates(
        position,
      );
      if (mounted) {
        UiFeedback.showSnackBar(
          context,
          message: 'Koordinat GPS berhasil diambil.',
        );
      }
    } catch (e) {
      if (mounted) {
        UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
      }
    } finally {
      if (mounted) setState(() => _isFetchingGps = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _kodeController = TextEditingController(text: widget.lahan?.kodeLahan);
    _namaController = TextEditingController(text: widget.lahan?.namaLahan);
    _luasController = TextEditingController(
      text: widget.lahan?.luas.toString(),
    );
    _lokasiController = TextEditingController(text: widget.lahan?.lokasi);
    _koordinatController = TextEditingController(text: widget.lahan?.koordinat);
    context.read<LahanFormBloc>().add(
      LahanFormEvent.started(lahan: widget.lahan),
    );
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _luasController.dispose();
    _lokasiController.dispose();
    _koordinatController.dispose();
    super.dispose();
  }

  double? _parseLuas(String value) {
    return double.tryParse(value.trim().replaceAll(',', '.'));
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final luas = _parseLuas(_luasController.text);
    if (luas == null) return;

    final koordinat = _koordinatController.text.trim();
    context.read<LahanFormBloc>().add(
      LahanFormEvent.submitted(
        kodeLahan: _kodeController.text.trim(),
        namaLahan: _namaController.text.trim(),
        luas: luas,
        lokasi: _lokasiController.text.trim(),
        koordinat: koordinat.isEmpty ? null : koordinat,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.lahan != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Lahan' : 'Tambah Lahan')),
      body: BlocConsumer<LahanFormBloc, LahanFormState>(
        listener: (context, state) {
          if (state is LahanFormSuccess) {
            UiFeedback.showSnackBar(
              context,
              message: isEdit
                  ? 'Data lahan berhasil diperbarui.'
                  : 'Data lahan berhasil ditambahkan.',
            );
            context.pop(true);
          }
          if (state is LahanFormError) {
            UiFeedback.showSnackBar(
              context,
              message: state.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LahanFormLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: _kodeController,
                    label: 'Kode Lahan',
                    validator: (v) =>
                        Validators.required(v, field: 'Kode Lahan'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _namaController,
                    label: 'Nama Lahan',
                    validator: (v) =>
                        Validators.required(v, field: 'Nama Lahan'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _luasController,
                    label: 'Luas (ha)',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: Validators.luas,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _lokasiController,
                    label: 'Lokasi',
                    maxLines: 3,
                    validator: (v) => Validators.required(v, field: 'Lokasi'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _koordinatController,
                          label: 'Koordinat (opsional)',
                          hint: 'Contoh: -6.200000, 106.816666',
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        child: IconButton.filled(
                          onPressed: _isFetchingGps || isLoading
                              ? null
                              : _fetchGps,
                          icon: _isFetchingGps
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.my_location),
                          tooltip: 'Ambil GPS',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppButton(
                    label: isEdit ? 'Simpan Perubahan' : 'Simpan',
                    onPressed: isLoading ? null : _submit,
                    isLoading: isLoading,
                    isExpanded: true,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
