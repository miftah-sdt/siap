import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/petani/domain/entities/petani.dart';
import 'package:siap/features/petani/domain/usecases/petani_usecases.dart';
import 'package:siap/features/petani/presentation/bloc/petani_form_event.dart';
import 'package:siap/features/petani/presentation/bloc/petani_form_state.dart';

class PetaniFormBloc extends Bloc<PetaniFormEvent, PetaniFormState> {
  PetaniFormBloc({
    required CreatePetaniUseCase createPetaniUseCase,
    required UpdatePetaniUseCase updatePetaniUseCase,
  }) : _createPetaniUseCase = createPetaniUseCase,
       _updatePetaniUseCase = updatePetaniUseCase,
       super(const PetaniFormState.initial()) {
    on<PetaniFormStarted>(_onStarted);
    on<PetaniFormSubmitted>(_onSubmitted);
  }

  final CreatePetaniUseCase _createPetaniUseCase;
  final UpdatePetaniUseCase _updatePetaniUseCase;

  Petani? _editingPetani;

  void _onStarted(PetaniFormStarted event, Emitter<PetaniFormState> emit) {
    _editingPetani = event.petani;
    if (event.petani != null) {
      emit(PetaniFormState.editing(event.petani!));
    } else {
      emit(const PetaniFormState.initial());
    }
  }

  Future<void> _onSubmitted(
    PetaniFormSubmitted event,
    Emitter<PetaniFormState> emit,
  ) async {
    emit(const PetaniFormState.loading());

    final Result<Petani> result;
    if (_editingPetani != null) {
      result = await _updatePetaniUseCase(
        UpdatePetaniParams(
          id: _editingPetani!.id,
          nik: event.nik,
          nama: event.nama,
          alamat: event.alamat,
          noHp: event.noHp,
          kelompokTani: event.kelompokTani,
        ),
      );
    } else {
      result = await _createPetaniUseCase(
        CreatePetaniParams(
          nik: event.nik,
          nama: event.nama,
          alamat: event.alamat,
          noHp: event.noHp,
          kelompokTani: event.kelompokTani,
        ),
      );
    }

    switch (result) {
      case Success():
        emit(const PetaniFormState.success());
      case ErrorResult(:final failure):
        emit(PetaniFormState.error(failure.message));
    }
  }
}
