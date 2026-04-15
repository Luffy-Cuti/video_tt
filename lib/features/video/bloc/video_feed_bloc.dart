import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/video_item.dart';
import '../../../core/services/kakoak_api_service.dart';

part 'video_feed_event.dart';
part 'video_feed_state.dart';

class VideoFeedBloc extends Bloc<VideoFeedEvent, VideoFeedState> {
  VideoFeedBloc(this._api) : super(const VideoFeedState()) {
    on<VideoFeedLoaded>(_onLoaded);
    on<VideoLiked>(_onLiked);
  }

  final KakoakApiService _api;

  Future<void> _onLoaded(VideoFeedLoaded event, Emitter<VideoFeedState> emit) async {
    emit(state.copyWith(status: VideoFeedStatus.loading));
    final videos = await _api.fetchHotAndNewVideos();
    emit(state.copyWith(status: VideoFeedStatus.success, videos: videos));
  }

  void _onLiked(VideoLiked event, Emitter<VideoFeedState> emit) {
    emit(state.copyWith(lastLikedId: event.videoId));
  }
}