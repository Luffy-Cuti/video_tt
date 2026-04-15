import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/channel.dart';
import '../../../core/services/kakoak_api_service.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc(this._api) : super(const ChannelState()) {
    on<ChannelCreated>(_onChannelCreated);
  }

  final KakoakApiService _api;

  Future<void> _onChannelCreated(
      ChannelCreated event,
      Emitter<ChannelState> emit,
      ) async {
    emit(state.copyWith(status: ChannelStatus.loading));
    final channel = await _api.createChannel(
      name: event.name,
      owner: event.owner,
      description: event.description,
    );
    emit(state.copyWith(status: ChannelStatus.success, myChannel: channel));
  }
}