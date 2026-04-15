part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.videos = const [],
    this.selectedCategory = 'All',
  });

  final HomeStatus status;
  final List<VideoItem> videos;
  final String selectedCategory;

  HomeState copyWith({
    HomeStatus? status,
    List<VideoItem>? videos,
    String? selectedCategory,
  }) {
    return HomeState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object> get props => [status, videos, selectedCategory];
}