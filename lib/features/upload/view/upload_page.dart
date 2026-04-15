import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/upload_bloc.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload video')),
      body: Center(
        child: BlocBuilder<UploadBloc, UploadState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Trạng thái: ${state.status.name}'),
                const SizedBox(height: 8),
                SizedBox(
                  width: 220,
                  child: LinearProgressIndicator(value: state.progress / 100),
                ),
                const SizedBox(height: 8),
                Text('Tiến độ: ${state.progress}%'),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: state.status == UploadStatus.uploading
                      ? null
                      : () => context.read<UploadBloc>().add(const UploadStarted()),
                  child: const Text('Bắt đầu upload'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}