import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'health_player_event.dart';
part 'health_player_state.dart';

class HealthPlayerBloc extends Bloc<HealthPlayerEvent, HealthPlayerState> {
  HealthPlayerBloc() : super(HealthPlayerInitial()) {
    on<HealthPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
