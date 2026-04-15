import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../bloc/channel_bloc.dart';

class ChannelCreatePage extends StatefulWidget {
  const ChannelCreatePage({super.key});

  @override
  State<ChannelCreatePage> createState() => _ChannelCreatePageState();
}

class _ChannelCreatePageState extends State<ChannelCreatePage> {
  final _name = TextEditingController();
  final _description = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final owner = context.select((AuthBloc bloc) => bloc.state.username);
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo channel')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Tên channel'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _description,
              decoration: const InputDecoration(labelText: 'Mô tả'),
            ),
            const SizedBox(height: 20),
            BlocConsumer<ChannelBloc, ChannelState>(
              listener: (context, state) {
                if (state.status == ChannelStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tạo channel thành công')),
                  );
                }
              },
              builder: (context, state) {
                return FilledButton(
                  onPressed: state.status == ChannelStatus.loading
                      ? null
                      : () {
                    context.read<ChannelBloc>().add(
                      ChannelCreated(
                        name: _name.text,
                        owner: owner,
                        description: _description.text,
                      ),
                    );
                  },
                  child: Text(
                    state.status == ChannelStatus.loading
                        ? 'Đang tạo...'
                        : 'Tạo channel',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}