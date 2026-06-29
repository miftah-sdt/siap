import 'package:flutter/material.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/core/utils/formatter.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/shared/widgets/status_badge.dart';

class PetaniCard extends StatelessWidget {
  const PetaniCard({
    super.key,
    required this.petani,
    this.onTap,
    this.onDelete,
    this.onApprove,
    this.onReject,
  });

  final Petani petani;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    final isPending =
        petani.registrationStatus == PetaniRegistrationStatus.pending;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: onTap,
              leading: CircleAvatar(
                child: Text(
                  petani.nama.isNotEmpty ? petani.nama[0].toUpperCase() : '?',
                ),
              ),
              title: Text(petani.nama),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIK: ${petani.nik}'),
                  Text('Kelompok: ${petani.kelompokTani}'),
                  Text('HP: ${Formatter.phone(petani.noHp)}'),
                ],
              ),
              isThreeLine: true,
              trailing: onDelete != null
                  ? IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: onDelete,
                    )
                  : null,
            ),
            if (petani.registrationStatus != PetaniRegistrationStatus.approved)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: switch (petani.registrationStatus) {
                  PetaniRegistrationStatus.pending => StatusBadge.pending(
                    petani.registrationStatus.label,
                  ),
                  PetaniRegistrationStatus.rejected => StatusBadge.error(
                    petani.registrationStatus.label,
                  ),
                  PetaniRegistrationStatus.approved => StatusBadge.success(
                    petani.registrationStatus.label,
                  ),
                },
              ),
            if (isPending && (onApprove != null || onReject != null))
              Row(
                children: [
                  if (onApprove != null)
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: onApprove,
                        icon: const Icon(Icons.check, size: 18),
                        label: const Text('Setujui'),
                      ),
                    ),
                  if (onApprove != null && onReject != null)
                    const SizedBox(width: AppSpacing.sm),
                  if (onReject != null)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onReject,
                        icon: const Icon(Icons.close, size: 18),
                        label: const Text('Tolak'),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
