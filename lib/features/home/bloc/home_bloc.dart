import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/video_item.dart';
import '../../../core/services/kakoak_api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._api) : super(const HomeState()) {
    on<HomeLoaded>(_onLoaded);
    on<HomeCategoryChanged>(_onCategoryChanged);
  }

  final KakoakApiService _api;

  Future<void> _onLoaded(HomeLoaded event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final videos = await _api.fetchHotAndNewVideos();
    emit(state.copyWith(status: HomeStatus.success, videos: videos));
  }

  Future<void> _onCategoryChanged(
      HomeCategoryChanged event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(status: HomeStatus.loading, selectedCategory: event.category));
    final videos = await _api.fetchVideosByCategory(event.category);
    emit(state.copyWith(status: HomeStatus.success, videos: videos));
  }
}