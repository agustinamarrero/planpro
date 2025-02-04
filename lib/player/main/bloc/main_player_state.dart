part of 'main_player_bloc.dart';

sealed class MainPlayerState extends Equatable {
  const MainPlayerState();

  @override
  List<Object> get props => [];
}

final class MainPlayerInitial extends MainPlayerState {}
