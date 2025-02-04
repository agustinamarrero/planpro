part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class AppUserTypeChanged extends AppEvent {
  AppUserTypeChanged(this.userType);

  final AppUserType userType;
}
