part of 'channel_bloc.dart';

sealed class ChannelEvent extends Equatable {
  const ChannelEvent();

  @override
  List<Object> get props => [];
}

final class ChannelCreated extends ChannelEvent {
  const ChannelCreated({
    required this.name,
    required this.owner,
    required this.description,
  });

  final String name;
  final String owner;
  final String description;

  @override
  List<Object> get props => [name, owner, description];
}