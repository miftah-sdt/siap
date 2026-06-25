import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/pengguna/domain/entities/pengguna.dart';
import 'package:siap/features/pengguna/domain/usecases/pengguna_usecases.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_form_event.dart';
import 'package:siap/features/pengguna/presentation/bloc/pengguna_form_state.dart';

class PenggunaFormBloc extends Bloc<PenggunaFormEvent, PenggunaFormState> {
  PenggunaFormBloc({
    required CreatePenggunaUseCase createPenggunaUseCase,
    required UpdatePenggunaUseCase updatePenggunaUseCase,
  }) : _createPenggunaUseCase = createPenggunaUseCase,
       _updatePenggunaUseCase = updatePenggunaUseCase,
       super(const PenggunaFormState.initial()) {
    on<PenggunaFormStarted>(_onStarted);
    on<PenggunaFormSubmitted>(_onSubmitted);
  }

  final CreatePenggunaUseCase _createPenggunaUseCase;
  final UpdatePenggunaUseCase _updatePenggunaUseCase;

  Pengguna? _editingPengguna;

  void _onStarted(PenggunaFormStarted event, Emitter<PenggunaFormState> emit) {
    _editingPengguna = event.pengguna;
    if (event.pengguna != null) {
      emit(PenggunaFormState.editing(event.pengguna!));
    } else {
      emit(const PenggunaFormState.initial());
    }
  }

  Future<void> _onSubmitted(
    PenggunaFormSubmitted event,
    Emitter<PenggunaFormState> emit,
  ) async {
    emit(const PenggunaFormState.loading());

    final Result<Pengguna> result;
    if (_editingPengguna != null) {
      result = await _updatePenggunaUseCase(
        UpdatePenggunaParams(
          id: _editingPengguna!.id,
          name: event.name,
          email: event.email,
          role: event.role,
          isActive: event.isActive,
        ),
      );
    } else {
      result = await _createPenggunaUseCase(
        CreatePenggunaParams(
          name: event.name,
          email: event.email,
          role: event.role,
          isActive: event.isActive,
        ),
      );
    }

    switch (result) {
      case Success():
        emit(const PenggunaFormState.success());
      case ErrorResult(:final failure):
        emit(PenggunaFormState.error(failure.message));
    }
  }
}
