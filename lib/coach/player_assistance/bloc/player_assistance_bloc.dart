import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_assistance_event.dart';
part 'player_assistance_state.dart';

class PlayerAssistanceBloc extends Bloc<PlayerAssistanceEvent, PlayerAssistanceState> {
  PlayerAssistanceBloc() : super(PlayerAssistanceInitial()) {
    on<PlayerAssistanceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
