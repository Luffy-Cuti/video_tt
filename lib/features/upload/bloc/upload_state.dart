part of 'upload_bloc.dart';

enum UploadStatus { idle, uploading, done }

class UploadState extends Equatable {
  const UploadState({this.status = UploadStatus.idle, this.progress = 0});

  final UploadStatus status;
  final int progress;

  UploadState copyWith({UploadStatus? status, int? progress}) {
    return UploadState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object> get props => [status, progress];
}