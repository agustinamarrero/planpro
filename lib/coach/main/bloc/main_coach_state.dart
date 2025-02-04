part of 'main_coach_bloc.dart';

sealed class MainCoachState extends Equatable {
  const MainCoachState();
  
  @override
  List<Object> get props => [];
}

final class MainCoachInitial extends MainCoachState {}
