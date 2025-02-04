part of 'survey_bloc.dart';

sealed class SurveyState extends Equatable {
  const SurveyState();

  @override
  List<Object> get props => [];
}

final class SurveyInitial extends SurveyState {}
