part of 'login_bloc.dart';

sealed class LoginEvent {}

final class LoginSwitchAppTypeChanged extends LoginEvent {
  LoginSwitchAppTypeChanged({required this.appUserType});
  final AppUserType appUserType;

  List<Object> get props => [appUserType];
}

class LoginFieldChanged extends LoginEvent {
  LoginFieldChanged({required this.fieldName, required this.value});
  final String fieldName;
  final String value;

  List<Object> get props => [fieldName, value];
}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted();
}

class LoginHealthFieldChanged extends LoginEvent {
  LoginHealthFieldChanged({required this.fieldName, required this.value});
  final String fieldName;
  final String value;

  List<Object> get props => [fieldName, value];
}

class LoginAddInjury extends LoginEvent {
  LoginAddInjury({required this.injury});
  final Injury injury;

  List<Object> get props => [injury];
}
