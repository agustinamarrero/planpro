part of 'health_player_bloc.dart';

sealed class HealthPlayerState extends Equatable {
  const HealthPlayerState();
  
  @override
  List<Object> get props => [];
}

final class HealthPlayerInitial extends HealthPlayerState {}
