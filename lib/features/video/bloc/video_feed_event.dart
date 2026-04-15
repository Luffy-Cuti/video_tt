part of 'video_feed_bloc.dart';

sealed class VideoFeedEvent extends Equatable {
  const VideoFeedEvent();

  @override
  List<Object> get props => [];
}

final class VideoFeedLoaded extends VideoFeedEvent {
  const VideoFeedLoaded();
}

final class VideoLiked extends VideoFeedEvent {
  const VideoLiked(this.videoId);

  final String videoId;

  @override
  List<Object> get props => [videoId];
}