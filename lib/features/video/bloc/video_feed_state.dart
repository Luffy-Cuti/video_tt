part of 'video_feed_bloc.dart';

enum VideoFeedStatus { initial, loading, success }

class VideoFeedState extends Equatable {
  const VideoFeedState({
    this.status = VideoFeedStatus.initial,
    this.videos = const [],
    this.lastLikedId,
  });

  final VideoFeedStatus status;
  final List<VideoItem> videos;
  final String? lastLikedId;

  VideoFeedState copyWith({
    VideoFeedStatus? status,
    List<VideoItem>? videos,
    String? lastLikedId,
  }) {
    return VideoFeedState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
      lastLikedId: lastLikedId ?? this.lastLikedId,
    );
  }

  @override
  List<Object?> get props => [status, videos, lastLikedId];
}