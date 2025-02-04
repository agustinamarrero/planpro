import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_player_event.dart';
part 'add_player_state.dart';

class AddPlayerBloc extends Bloc<AddPlayerEvent, AddPlayerState> {
  AddPlayerBloc() : super(AddPlayerInitial()) {
    on<AddPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
