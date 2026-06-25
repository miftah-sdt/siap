import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/klaim/domain/entities/klaim.dart';
import 'package:siap/features/klaim/domain/usecases/klaim_usecases.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_event.dart';
import 'package:siap/features/klaim/presentation/bloc/klaim_form_state.dart';

class KlaimFormBloc extends Bloc<KlaimFormEvent, KlaimFormState> {
  KlaimFormBloc({
    required CreateKlaimUseCase createKlaimUseCase,
    required UpdateKlaimUseCase updateKlaimUseCase,
  }) : _createKlaimUseCase = createKlaimUseCase,
       _updateKlaimUseCase = updateKlaimUseCase,
       super(const KlaimFormState.initial()) {
    on<KlaimFormStarted>(_onStarted);
    on<KlaimFormSubmitted>(_onSubmitted);
  }

  final CreateKlaimUseCase _createKlaimUseCase;
  final UpdateKlaimUseCase _updateKlaimUseCase;

  Klaim? _editingKlaim;

  void _onStarted(KlaimFormStarted event, Emitter<KlaimFormState> emit) {
    _editingKlaim = event.klaim;
    if (event.klaim != null) {
      emit(KlaimFormState.editing(event.klaim!));
    } else {
      emit(const KlaimFormState.initial());
    }
  }

  Future<void> _onSubmitted(
    KlaimFormSubmitted event,
    Emitter<KlaimFormState> emit,
  ) async {
    emit(const KlaimFormState.loading());

    final Result<Klaim> result;
    if (_editingKlaim != null) {
      result = await _updateKlaimUseCase(
        UpdateKlaimParams(
          id: _editingKlaim!.id,
          nomorKlaim: event.nomorKlaim,
          polisId: event.polisId,
          polisNomor: event.polisNomor,
          deskripsi: event.deskripsi,
          buktiKerusakan: event.buktiKerusakan,
        ),
      );
    } else {
      result = await _createKlaimUseCase(
        CreateKlaimParams(
          nomorKlaim: event.nomorKlaim,
          polisId: event.polisId,
          polisNomor: event.polisNomor,
          deskripsi: event.deskripsi,
          buktiKerusakan: event.buktiKerusakan,
        ),
      );
    }

    switch (result) {
      case Success():
        emit(const KlaimFormState.success());
      case ErrorResult(:final failure):
        emit(KlaimFormState.error(failure.message));
    }
  }
}
