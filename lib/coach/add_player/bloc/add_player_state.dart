part of 'add_player_bloc.dart';

sealed class AddPlayerState extends Equatable {
  const AddPlayerState();
  
  @override
  List<Object> get props => [];
}

final class AddPlayerInitial extends AddPlayerState {}
