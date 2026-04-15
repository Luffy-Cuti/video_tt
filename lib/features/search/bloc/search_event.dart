part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchKeywordChanged extends SearchEvent {
  const SearchKeywordChanged(this.keyword);

  final String keyword;

  @override
  List<Object> get props => [keyword];
}