part of 'channel_bloc.dart';

enum ChannelStatus { initial, loading, success }

class ChannelState extends Equatable {
  const ChannelState({
    this.status = ChannelStatus.initial,
    this.myChannel,
  });

  final ChannelStatus status;
  final Channel? myChannel;

  ChannelState copyWith({ChannelStatus? status, Channel? myChannel}) {
    return ChannelState(
      status: status ?? this.status,
      myChannel: myChannel ?? this.myChannel,
    );
  }

  @override
  List<Object?> get props => [status, myChannel];
}