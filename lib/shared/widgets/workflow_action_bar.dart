import 'package:flutter/material.dart';
import 'package:siap/core/auth/role_context.dart';
import 'package:siap/core/auth/workflow_permissions.dart';
import 'package:siap/core/theme/app_spacing.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/shared/widgets/app_button.dart';

typedef WorkflowActionCallback = Future<void> Function(WorkflowAction action);

class WorkflowActionBar extends StatelessWidget {
  const WorkflowActionBar.asuransi({
    super.key,
    required this.status,
    required this.onAction,
    this.isLoading = false,
  }) : _module = _WorkflowModule.asuransi,
       _klaimStatus = null;

  const WorkflowActionBar.klaim({
    super.key,
    required KlaimStatus status,
    required this.onAction,
    this.isLoading = false,
  }) : _module = _WorkflowModule.klaim,
       status = null,
       _klaimStatus = status;

  final AsuransiStatus? status;
  final KlaimStatus? _klaimStatus;
  final _WorkflowModule _module;
  final WorkflowActionCallback onAction;
  final bool isLoading;

  List<WorkflowAction> _actions(BuildContext context) {
    final role = context.userRole;
    return switch (_module) {
      _WorkflowModule.asuransi => WorkflowPermissions.asuransiActions(
        role,
        status!,
      ),
      _WorkflowModule.klaim => WorkflowPermissions.klaimActions(
        role,
        _klaimStatus!,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final actions = _actions(context);
    if (actions.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Persetujuan', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Pilih aksi untuk memajukan status data.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final action in actions)
                  AppButton(
                    label: _module == _WorkflowModule.asuransi
                        ? action.labelForAsuransi()
                        : action.labelForKlaim(),
                    icon: _iconFor(action),
                    variant: action == WorkflowAction.reject
                        ? AppButtonVariant.secondary
                        : AppButtonVariant.primary,
                    onPressed: isLoading ? null : () => onAction(action),
                    isLoading: isLoading,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(WorkflowAction action) => switch (action) {
    WorkflowAction.submit => Icons.send_outlined,
    WorkflowAction.verify => Icons.verified_outlined,
    WorkflowAction.survey => Icons.search_outlined,
    WorkflowAction.approve => Icons.check_circle_outline,
    WorkflowAction.reject => Icons.cancel_outlined,
  };
}

enum _WorkflowModule { asuransi, klaim }
