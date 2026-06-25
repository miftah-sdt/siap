import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/asuransi/domain/entities/asuransi.dart';
import 'package:siap/features/asuransi/domain/usecases/asuransi_usecases.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_event.dart';
import 'package:siap/features/asuransi/presentation/bloc/asuransi_form_state.dart';

class AsuransiFormBloc extends Bloc<AsuransiFormEvent, AsuransiFormState> {
  AsuransiFormBloc({
    required CreateAsuransiUseCase createAsuransiUseCase,
    required UpdateAsuransiUseCase updateAsuransiUseCase,
  }) : _createAsuransiUseCase = createAsuransiUseCase,
       _updateAsuransiUseCase = updateAsuransiUseCase,
       super(const AsuransiFormState.initial()) {
    on<AsuransiFormStarted>(_onStarted);
    on<AsuransiFormSubmitted>(_onSubmitted);
  }

  final CreateAsuransiUseCase _createAsuransiUseCase;
  final UpdateAsuransiUseCase _updateAsuransiUseCase;

  Asuransi? _editingAsuransi;

  void _onStarted(AsuransiFormStarted event, Emitter<AsuransiFormState> emit) {
    _editingAsuransi = event.asuransi;
    if (event.asuransi != null) {
      emit(AsuransiFormState.editing(event.asuransi!));
    } else {
      emit(const AsuransiFormState.initial());
    }
  }

  Future<void> _onSubmitted(
    AsuransiFormSubmitted event,
    Emitter<AsuransiFormState> emit,
  ) async {
    emit(const AsuransiFormState.loading());

    final Result<Asuransi> result;
    if (_editingAsuransi != null) {
      result = await _updateAsuransiUseCase(
        UpdateAsuransiParams(
          id: _editingAsuransi!.id,
          nomorPolis: event.nomorPolis,
          petaniId: event.petaniId,
          petaniNama: event.petaniNama,
          lahanId: event.lahanId,
          lahanNama: event.lahanNama,
          documents: event.documents,
        ),
      );
    } else {
      result = await _createAsuransiUseCase(
        CreateAsuransiParams(
          nomorPolis: event.nomorPolis,
          petaniId: event.petaniId,
          petaniNama: event.petaniNama,
          lahanId: event.lahanId,
          lahanNama: event.lahanNama,
          documents: event.documents,
        ),
      );
    }

    switch (result) {
      case Success():
        emit(const AsuransiFormState.success());
      case ErrorResult(:final failure):
        emit(AsuransiFormState.error(failure.message));
    }
  }
}
