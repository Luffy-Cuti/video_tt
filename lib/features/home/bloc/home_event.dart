part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeLoaded extends HomeEvent {
  const HomeLoaded();
}

final class HomeCategoryChanged extends HomeEvent {
  const HomeCategoryChanged(this.category);

  final String category;

  @override
  List<Object> get props => [category];
}