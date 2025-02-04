part of 'personal_data_player_bloc.dart';

sealed class PersonalDataPlayerState extends Equatable {
  const PersonalDataPlayerState();
  
  @override
  List<Object> get props => [];
}

final class PersonalDataPlayerInitial extends PersonalDataPlayerState {}
