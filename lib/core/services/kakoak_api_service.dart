import '../models/channel.dart';
import '../models/video_item.dart';

/// Placeholder service for Kakoak Dev API (Minh Anh).
///
/// API endpoints are intentionally mocked for now.
class KakoakApiService {
  Future<List<VideoItem>> fetchHotAndNewVideos() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return _mockVideos;
  }

  Future<List<VideoItem>> fetchVideosByCategory(String category) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return _mockVideos.where((video) => video.category == category).toList();
  }

  Future<(List<VideoItem>, List<Channel>)> search(String query) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    final q = query.toLowerCase();
    final videos = _mockVideos
        .where(
          (video) =>
      video.title.toLowerCase().contains(q) ||
          video.channelName.toLowerCase().contains(q),
    )
        .toList();
    final channels = _mockChannels
        .where((channel) => channel.name.toLowerCase().contains(q))
        .toList();
    return (videos, channels);
  }

  Future<Channel> createChannel({
    required String name,
    required String owner,
    required String description,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return Channel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      owner: owner,
      description: description,
      followers: 0,
    );
  }

  static final List<Channel> _mockChannels = [
    const Channel(
      id: 'c1',
      name: 'Tech Shorts',
      owner: 'Minh Anh',
      description: 'Video công nghệ ngắn mỗi ngày.',
      followers: 12130,
    ),
    const Channel(
      id: 'c2',
      name: 'Food Vibes',
      owner: 'Hana',
      description: 'Món ngon dễ làm và review đồ ăn.',
      followers: 5872,
    ),
  ];

  static final List<VideoItem> _mockVideos = [
    const VideoItem(
      id: 'v1',
      title: 'Flutter Tips 60s',
      channelName: 'Tech Shorts',
      description: '3 mẹo tối ưu build cho Flutter app.',
      category: 'Technology',
      likes: 1200,
      shares: 143,
      isHot: true,
      isNew: true,
    ),
    const VideoItem(
      id: 'v2',
      title: 'Mì trộn siêu nhanh',
      channelName: 'Food Vibes',
      description: 'Làm mì trộn 5 phút cực cuốn.',
      category: 'Food',
      likes: 980,
      shares: 72,
      isHot: true,
      isNew: false,
    ),
    const VideoItem(
      id: 'v3',
      title: 'Setup góc làm việc',
      channelName: 'Tech Shorts',
      description: 'Trang trí góc làm việc tối giản.',
      category: 'Lifestyle',
      likes: 542,
      shares: 35,
      isHot: false,
      isNew: true,
    ),
  ];
}