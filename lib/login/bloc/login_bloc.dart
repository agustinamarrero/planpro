import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plantelpro/app/bloc/app_bloc.dart';
import 'package:plantelpro/packages/auth_repository/auth_repository.dart';
import 'package:plantelpro/users/coach.dart';
import 'package:plantelpro/users/player.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState.initial()) {
    on<LoginSwitchAppTypeChanged>(_onLoginSwitchAppTypeChanged);
    on<LoginFieldChanged>(_onLoginFieldChanged);
    on<LoginSubmitted>(_onLoginSubmit);
    on<LoginHealthFieldChanged>(_onLoginHealthFieldChanged);
    on<LoginAddInjury>(_onLoginAddInjury);
  }

  final AuthRepository _authRepository;

  void _onLoginSwitchAppTypeChanged(
    LoginSwitchAppTypeChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(userType: event.appUserType));
  }

  void _onLoginFieldChanged(
    LoginFieldChanged event,
    Emitter<LoginState> emit,
  ) {
    switch (event.fieldName) {
      case 'name':
        emit(state.copyWith(name: event.value));
      case 'email':
        emit(state.copyWith(email: event.value));
      case 'password':
        emit(state.copyWith(password: event.value));
      case 'phone':
        emit(state.copyWith(phone: event.value));
      case 'altura':
        emit(state.copyWith(altura: double.tryParse(event.value)));
      case 'peso':
        emit(state.copyWith(peso: double.tryParse(event.value)));
      case 'cuadro':
        emit(state.copyWith(cuadro: event.value));
      case 'liga':
        emit(state.copyWith(liga: event.value));
      case 'position':
        emit(state.copyWith(position: event.value));
    }
  }

  Future<void> _onLoginSubmit(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.userType == AppUserType.player) {
      final player = Player(
        name: state.name,
        email: state.email,
        height: state.altura ?? 0.0,
        weight: state.peso ?? 0.0,
        medicalExpiration: state.medicalExpiration,
        medicalFile: state.medicalFile,
        previousInjuries: state.previousInjuries,
        typeOfPlayer: TypeOfPlayer.values.firstWhere(
          (element) => element.displayName == state.position,
        ),
      );
      await _authRepository.registerPlayer(
        player,
        state.password,
      );
    } else if (state.userType == AppUserType.coach) {
      final coach = Coach(
        name: state.name,
        email: state.email,
        phoneNumber: state.phone,
        cuadro: state.cuadro,
        liga: state.liga,
      );
      await _authRepository.registerCoach(
        coach,
        state.password,
      );
    }
  }

  void _onLoginHealthFieldChanged(
    LoginHealthFieldChanged event,
    Emitter<LoginState> emit,
  ) {
    switch (event.fieldName) {
      case 'medicalExpiration':
        emit(state.copyWith(medicalExpiration: event.value));
      case 'medicalFile':
        emit(state.copyWith(medicalFile: event.value));
    }
  }

  void _onLoginAddInjury(
    LoginAddInjury event,
    Emitter<LoginState> emit,
  ) {
    final updatedInjuries = List<Injury>.from(state.previousInjuries)
      ..add(event.injury);
    emit(state.copyWith(previousInjuries: updatedInjuries));
  }
}
