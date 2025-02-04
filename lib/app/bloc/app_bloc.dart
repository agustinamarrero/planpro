import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.initial()) {
    on<AppUserTypeChanged>(_onAppUserTypeChanged);
  }

  FutureOr<void> _onAppUserTypeChanged(
    AppUserTypeChanged event,
    Emitter<AppState> emit,
  ) {
    final userType = event.userType;
    emit(state.copyWith(userType: userType));
  }
}
