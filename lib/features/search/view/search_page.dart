import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search video / channel')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nhập từ khóa',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<SearchBloc>().add(SearchKeywordChanged(value));
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.status == SearchStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView(
                    children: [
                      const Text('Videos', style: TextStyle(fontWeight: FontWeight.bold)),
                      ...state.videos.map(
                            (v) => ListTile(
                          title: Text(v.title),
                          subtitle: Text(v.channelName),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Channels', style: TextStyle(fontWeight: FontWeight.bold)),
                      ...state.channels.map(
                            (c) => ListTile(
                          title: Text(c.name),
                          subtitle: Text('${c.followers} followers'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}