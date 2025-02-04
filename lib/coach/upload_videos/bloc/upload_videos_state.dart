part of 'upload_videos_bloc.dart';

sealed class UploadVideosState extends Equatable {
  const UploadVideosState();
  
  @override
  List<Object> get props => [];
}

final class UploadVideosInitial extends UploadVideosState {}
