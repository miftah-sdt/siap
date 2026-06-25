import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siap/core/utils/result.dart';
import 'package:siap/features/lahan/domain/entities/lahan.dart';
import 'package:siap/features/lahan/domain/usecases/lahan_usecases.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_form_event.dart';
import 'package:siap/features/lahan/presentation/bloc/lahan_form_state.dart';

class LahanFormBloc extends Bloc<LahanFormEvent, LahanFormState> {
  LahanFormBloc({
    required CreateLahanUseCase createLahanUseCase,
    required UpdateLahanUseCase updateLahanUseCase,
  }) : _createLahanUseCase = createLahanUseCase,
       _updateLahanUseCase = updateLahanUseCase,
       super(const LahanFormState.initial()) {
    on<LahanFormStarted>(_onStarted);
    on<LahanFormSubmitted>(_onSubmitted);
  }

  final CreateLahanUseCase _createLahanUseCase;
  final UpdateLahanUseCase _updateLahanUseCase;

  Lahan? _editingLahan;

  void _onStarted(LahanFormStarted event, Emitter<LahanFormState> emit) {
    _editingLahan = event.lahan;
    if (event.lahan != null) {
      emit(LahanFormState.editing(event.lahan!));
    } else {
      emit(const LahanFormState.initial());
    }
  }

  Future<void> _onSubmitted(
    LahanFormSubmitted event,
    Emitter<LahanFormState> emit,
  ) async {
    emit(const LahanFormState.loading());

    final Result<Lahan> result;
    if (_editingLahan != null) {
      result = await _updateLahanUseCase(
        UpdateLahanParams(
          id: _editingLahan!.id,
          kodeLahan: event.kodeLahan,
          namaLahan: event.namaLahan,
          luas: event.luas,
          lokasi: event.lokasi,
          koordinat: event.koordinat,
        ),
      );
    } else {
      result = await _createLahanUseCase(
        CreateLahanParams(
          kodeLahan: event.kodeLahan,
          namaLahan: event.namaLahan,
          luas: event.luas,
          lokasi: event.lokasi,
          koordinat: event.koordinat,
        ),
      );
    }

    switch (result) {
      case Success():
        emit(const LahanFormState.success());
      case ErrorResult(:final failure):
        emit(LahanFormState.error(failure.message));
    }
  }
}
