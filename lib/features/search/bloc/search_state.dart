part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success }

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.keyword = '',
    this.videos = const [],
    this.channels = const [],
  });

  final SearchStatus status;
  final String keyword;
  final List<VideoItem> videos;
  final List<Channel> channels;

  SearchState copyWith({
    SearchStatus? status,
    String? keyword,
    List<VideoItem>? videos,
    List<Channel>? channels,
  }) {
    return SearchState(
      status: status ?? this.status,
      keyword: keyword ?? this.keyword,
      videos: videos ?? this.videos,
      channels: channels ?? this.channels,
    );
  }

  @override
  List<Object> get props => [status, keyword, videos, channels];
}