import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_videos_event.dart';
part 'upload_videos_state.dart';

class UploadVideosBloc extends Bloc<UploadVideosEvent, UploadVideosState> {
  UploadVideosBloc() : super(UploadVideosInitial()) {
    on<UploadVideosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
