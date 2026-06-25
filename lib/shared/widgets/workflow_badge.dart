import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/shared/widgets/status_badge.dart';

class WorkflowBadge {
  const WorkflowBadge._();

  static StatusBadge asuransi(AsuransiStatus status) {
    return switch (status) {
      AsuransiStatus.draft => StatusBadge.draft(status.label),
      AsuransiStatus.submitted => StatusBadge.pending(status.label),
      AsuransiStatus.verified => StatusBadge.info(status.label),
      AsuransiStatus.approved => StatusBadge.success(status.label),
      AsuransiStatus.rejected => StatusBadge.error(status.label),
    };
  }

  static StatusBadge klaim(KlaimStatus status) {
    return switch (status) {
      KlaimStatus.draft => StatusBadge.draft(status.label),
      KlaimStatus.submitted => StatusBadge.pending(status.label),
      KlaimStatus.survey => StatusBadge.info(status.label),
      KlaimStatus.approved => StatusBadge.success(status.label),
      KlaimStatus.rejected => StatusBadge.error(status.label),
    };
  }
}
