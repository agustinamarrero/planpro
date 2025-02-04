part of 'player_assistance_bloc.dart';

sealed class PlayerAssistanceState extends Equatable {
  const PlayerAssistanceState();
  
  @override
  List<Object> get props => [];
}

final class PlayerAssistanceInitial extends PlayerAssistanceState {}
