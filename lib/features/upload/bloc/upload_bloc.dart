import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/services/notification_service.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc(this._notificationService) : super(const UploadState()) {
    on<UploadStarted>(_onStarted);
    on<UploadProgressUpdated>(_onProgressUpdated);
    on<UploadFinished>(_onFinished);
  }

  final NotificationService _notificationService;

  Future<void> _onStarted(UploadStarted event, Emitter<UploadState> emit) async {
    emit(const UploadState(status: UploadStatus.uploading, progress: 0));
    for (var i = 10; i <= 100; i += 10) {
      await Future<void>.delayed(const Duration(milliseconds: 250));
      add(UploadProgressUpdated(i));
    }
    add(const UploadFinished());
  }

  Future<void> _onProgressUpdated(
      UploadProgressUpdated event,
      Emitter<UploadState> emit,
      ) async {
    await _notificationService.showUploadProgress(event.progress);
    emit(state.copyWith(progress: event.progress));
  }

  Future<void> _onFinished(
      UploadFinished event,
      Emitter<UploadState> emit,
      ) async {
    emit(state.copyWith(status: UploadStatus.done, progress: 100));
  }
}