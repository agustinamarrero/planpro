part of 'app_bloc.dart';

enum AppUserType {
  player,
  coach;

  bool get isPlayer => this == AppUserType.player;
  bool get isCoach => this == AppUserType.coach;
}

enum TypeOfPlayer {
  goalkeeper,
  defender,
  midfielder,
  forward;

  String get displayName {
    switch (this) {
      case TypeOfPlayer.goalkeeper:
        return 'Golero';
      case TypeOfPlayer.defender:
        return 'Defensa';
      case TypeOfPlayer.midfielder:
        return 'Medio Campista';
      case TypeOfPlayer.forward:
        return 'Delantero';
    }
  }

  String get englishName {
    switch (this) {
      case TypeOfPlayer.goalkeeper:
        return 'Goalkeeper';
      case TypeOfPlayer.defender:
        return 'Defender';
      case TypeOfPlayer.midfielder:
        return 'Midfielder';
      case TypeOfPlayer.forward:
        return 'Forward';
    }
  }
}

extension AppUserTypeExtension on AppUserType {
  String get displayName {
    switch (this) {
      case AppUserType.player:
        return 'Jugador';
      case AppUserType.coach:
        return 'Coach';
    }
  }

  String get englishName {
    switch (this) {
      case AppUserType.player:
        return 'Player';
      case AppUserType.coach:
        return 'Coach';
    }
  }
}

@immutable
class AppState {
  const AppState({
    required this.userType,
    required this.typeOfPlayer,
  });

  const AppState.initial()
      : this(
          userType: AppUserType.player,
          typeOfPlayer: TypeOfPlayer.goalkeeper,
        );

  final AppUserType userType;
  final TypeOfPlayer typeOfPlayer;

  AppState copyWith({
    AppUserType? userType,
    TypeOfPlayer? typeOfPlayer,
  }) {
    return AppState(
      userType: userType ?? this.userType,
      typeOfPlayer: typeOfPlayer ?? this.typeOfPlayer,
    );
  }
}
