import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/video_feed_bloc.dart';

class VideoFeedPage extends StatelessWidget {
  const VideoFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoFeedBloc, VideoFeedState>(
        builder: (context, state) {
          if (state.status != VideoFeedStatus.success) {
            return const Center(child: CircularProgressIndicator());
          }

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.videos.length,
            itemBuilder: (context, index) {
              final video = state.videos[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: Colors.black87),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '@${video.channelName}',
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            video.description,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12, bottom: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              context.read<VideoFeedBloc>().add(VideoLiked(video.id));
                            },
                            icon: const Icon(Icons.favorite),
                          ),
                          Text('${video.likes}', style: const TextStyle(color: Colors.white)),
                          const SizedBox(height: 8),
                          const Icon(Icons.share, color: Colors.white),
                          Text('${video.shares}', style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}