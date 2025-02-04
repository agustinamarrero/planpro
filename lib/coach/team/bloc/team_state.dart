part of 'team_bloc.dart';

sealed class TeamState extends Equatable {
  const TeamState();
  
  @override
  List<Object> get props => [];
}

final class TeamInitial extends TeamState {}
