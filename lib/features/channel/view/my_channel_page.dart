import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/channel_bloc.dart';

class MyChannelPage extends StatelessWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Channel')),
      body: BlocBuilder<ChannelBloc, ChannelState>(
        builder: (context, state) {
          final channel = state.myChannel;
          if (channel == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Bạn chưa có channel'),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () => Navigator.pushNamed(context, '/create-channel'),
                    child: const Text('Tạo channel ngay'),
                  ),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(channel.name, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(channel.description),
              const SizedBox(height: 8),
              Text('Followers: ${channel.followers}'),
            ],
          );
        },
      ),
    );
  }
}