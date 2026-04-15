import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/channel.dart';
import '../../../core/models/video_item.dart';
import '../../../core/services/kakoak_api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._api) : super(const SearchState()) {
    on<SearchKeywordChanged>(_onKeywordChanged);
  }

  final KakoakApiService _api;

  Future<void> _onKeywordChanged(
      SearchKeywordChanged event,
      Emitter<SearchState> emit,
      ) async {
    if (event.keyword.trim().isEmpty) {
      emit(const SearchState());
      return;
    }

    emit(state.copyWith(status: SearchStatus.loading, keyword: event.keyword));
    final (videos, channels) = await _api.search(event.keyword);
    emit(
      state.copyWith(
        status: SearchStatus.success,
        videos: videos,
        channels: channels,
      ),
    );
  }
}