import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const categories = ['Technology', 'Food', 'Lifestyle'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Hot & New')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, i) {
                    final category = categories[i];
                    return ChoiceChip(
                      label: Text(category),
                      selected: state.selectedCategory == category,
                      onSelected: (_) {
                        context.read<HomeBloc>().add(HomeCategoryChanged(category));
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: categories.length,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.videos.length,
                  itemBuilder: (context, index) {
                    final video = state.videos[index];
                    return ListTile(
                      leading: const Icon(Icons.play_circle_outline),
                      title: Text(video.title),
                      subtitle: Text(
                        '${video.channelName} • ${video.category} • ❤️ ${video.likes}',
                      ),
                      trailing: Wrap(
                        spacing: 4,
                        children: [
                          if (video.isHot) const Chip(label: Text('Hot')),
                          if (video.isNew) const Chip(label: Text('New')),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}