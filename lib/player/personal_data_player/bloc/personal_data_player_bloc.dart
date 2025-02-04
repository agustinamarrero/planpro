import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'personal_data_player_event.dart';
part 'personal_data_player_state.dart';

class PersonalDataPlayerBloc extends Bloc<PersonalDataPlayerEvent, PersonalDataPlayerState> {
  PersonalDataPlayerBloc() : super(PersonalDataPlayerInitial()) {
    on<PersonalDataPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
