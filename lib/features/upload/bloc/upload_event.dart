part of 'upload_bloc.dart';

sealed class UploadEvent extends Equatable {
  const UploadEvent();

  @override
  List<Object> get props => [];
}

final class UploadStarted extends UploadEvent {
  const UploadStarted();
}

final class UploadProgressUpdated extends UploadEvent {
  const UploadProgressUpdated(this.progress);

  final int progress;

  @override
  List<Object> get props => [progress];
}

final class UploadFinished extends UploadEvent {
  const UploadFinished();
}