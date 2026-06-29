import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

enum WorkflowAction {
  submit,
  verify,
  approve,
  reject,
  survey;

  String get apiPath => name;

  String labelForAsuransi() => switch (this) {
    WorkflowAction.submit => 'Ajukan',
    WorkflowAction.verify => 'Verifikasi',
    WorkflowAction.approve => 'Setujui',
    WorkflowAction.reject => 'Tolak',
    WorkflowAction.survey => 'Survey',
  };

  String labelForKlaim() => switch (this) {
    WorkflowAction.submit => 'Ajukan Klaim',
    WorkflowAction.survey => 'Mulai Survey',
    WorkflowAction.approve => 'Setujui',
    WorkflowAction.reject => 'Tolak',
    WorkflowAction.verify => 'Verifikasi',
  };
}

class WorkflowPermissions {
  const WorkflowPermissions._();

  static const _submitRoles = {
    UserRole.admin,
    UserRole.operator,
    UserRole.petani,
  };

  static const _reviewRoles = {UserRole.admin, UserRole.verifikator};

  static List<WorkflowAction> asuransiActions(
    UserRole role,
    AsuransiStatus status,
  ) {
    return switch (status) {
      AsuransiStatus.draft =>
        _submitRoles.contains(role) ? [WorkflowAction.submit] : [],
      AsuransiStatus.submitted =>
        _reviewRoles.contains(role)
            ? [WorkflowAction.verify, WorkflowAction.reject]
            : [],
      AsuransiStatus.verified =>
        _reviewRoles.contains(role)
            ? [WorkflowAction.approve, WorkflowAction.reject]
            : [],
      AsuransiStatus.approved || AsuransiStatus.rejected => [],
    };
  }

  static List<WorkflowAction> klaimActions(UserRole role, KlaimStatus status) {
    return switch (status) {
      KlaimStatus.draft =>
        _submitRoles.contains(role) ? [WorkflowAction.submit] : [],
      KlaimStatus.submitted =>
        _reviewRoles.contains(role)
            ? [WorkflowAction.survey, WorkflowAction.reject]
            : [],
      KlaimStatus.survey =>
        _reviewRoles.contains(role)
            ? [WorkflowAction.approve, WorkflowAction.reject]
            : [],
      KlaimStatus.approved || KlaimStatus.rejected => [],
    };
  }
}
