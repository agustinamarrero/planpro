import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_player_event.dart';
part 'main_player_state.dart';

class MainPlayerBloc extends Bloc<MainPlayerEvent, MainPlayerState> {
  MainPlayerBloc() : super(MainPlayerInitial()) {
    on<MainPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
