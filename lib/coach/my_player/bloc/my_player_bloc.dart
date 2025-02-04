import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_player_event.dart';
part 'my_player_state.dart';

class MyPlayerBloc extends Bloc<MyPlayerEvent, MyPlayerState> {
  MyPlayerBloc() : super(MyPlayerInitial()) {
    on<MyPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
