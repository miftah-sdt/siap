import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/ui_feedback.dart';
import 'package:siap/core/services/rfi_remote_service.dart';
import 'package:siap/injection/dependency_injection.dart';

class AskrindoSyncPanel extends StatefulWidget {
  const AskrindoSyncPanel({
    super.key,
    required this.asuransiId,
    this.askrindoRef,
    this.askrindoStatus,
  });

  final String asuransiId;
  final String? askrindoRef;
  final String? askrindoStatus;

  @override
  State<AskrindoSyncPanel> createState() => _AskrindoSyncPanelState();
}

class _AskrindoSyncPanelState extends State<AskrindoSyncPanel> {
  bool _isSubmitting = false;
  String? _ref;
  String? _status;

  @override
  void initState() {
    super.initState();
    _ref = widget.askrindoRef;
    _status = widget.askrindoStatus;
  }

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);
    try {
      final result = await sl<RfiRemoteService>().submitToAskrindo(
        widget.asuransiId,
      );
      if (!mounted) return;
      setState(() {
        _ref = result['reference_id'] as String?;
        _status = result['status'] as String? ?? 'submitted';
        _isSubmitting = false;
      });
      UiFeedback.showSnackBar(
        context,
        message:
            result['message'] as String? ?? 'Berhasil dikirim ke Askrindo.',
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      UiFeedback.showSnackBar(context, message: e.toString(), isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasRef = _ref != null && _ref!.isNotEmpty;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.sync_outlined),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Integrasi Core Askrindo',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'Kirim data akseptasi ke sistem inti Askrindo (mode stub untuk demonstrasi RFI).',
            ),
            if (hasRef) ...[
              const SizedBox(height: AppSpacing.md),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.tag_outlined),
                title: const Text('Referensi'),
                subtitle: Text(_ref!),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.info_outline),
                title: const Text('Status'),
                subtitle: Text(_status ?? 'pending'),
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            FilledButton.icon(
              onPressed: _isSubmitting || hasRef ? null : _submit,
              icon: _isSubmitting
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.cloud_upload_outlined),
              label: Text(hasRef ? 'Sudah Terkirim' : 'Kirim ke Askrindo'),
            ),
          ],
        ),
      ),
    );
  }
}
