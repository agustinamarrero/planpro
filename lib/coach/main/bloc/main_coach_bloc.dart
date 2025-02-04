import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_coach_event.dart';
part 'main_coach_state.dart';

class MainCoachBloc extends Bloc<MainCoachEvent, MainCoachState> {
  MainCoachBloc() : super(MainCoachInitial()) {
    on<MainCoachEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
