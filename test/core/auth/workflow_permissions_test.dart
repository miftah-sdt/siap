import 'package:flutter_test/flutter_test.dart';
import 'package:siap/core/auth/workflow_permissions.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/auth/domain/entities/user.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';

void main() {
  group('WorkflowPermissions', () {
    test('petani can submit draft asuransi', () {
      final actions = WorkflowPermissions.asuransiActions(
        UserRole.petani,
        AsuransiStatus.draft,
      );
      expect(actions, [WorkflowAction.submit]);
    });

    test('verifikator can verify submitted asuransi', () {
      final actions = WorkflowPermissions.asuransiActions(
        UserRole.verifikator,
        AsuransiStatus.submitted,
      );
      expect(actions, contains(WorkflowAction.verify));
      expect(actions, contains(WorkflowAction.reject));
    });

    test('admin can approve verified asuransi', () {
      final actions = WorkflowPermissions.asuransiActions(
        UserRole.admin,
        AsuransiStatus.verified,
      );
      expect(actions, contains(WorkflowAction.approve));
    });

    test('klaim survey flow for verifikator', () {
      final submitted = WorkflowPermissions.klaimActions(
        UserRole.verifikator,
        KlaimStatus.submitted,
      );
      expect(submitted, contains(WorkflowAction.survey));

      final survey = WorkflowPermissions.klaimActions(
        UserRole.verifikator,
        KlaimStatus.survey,
      );
      expect(survey, contains(WorkflowAction.approve));
    });

    test('approved records have no workflow actions', () {
      expect(
        WorkflowPermissions.asuransiActions(
          UserRole.admin,
          AsuransiStatus.approved,
        ),
        isEmpty,
      );
      expect(
        WorkflowPermissions.klaimActions(UserRole.admin, KlaimStatus.approved),
        isEmpty,
      );
    });
  });
}
