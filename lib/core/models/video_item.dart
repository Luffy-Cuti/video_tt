import 'package:equatable/equatable.dart';

class VideoItem extends Equatable {
  const VideoItem({
    required this.id,
    required this.title,
    required this.channelName,
    required this.description,
    required this.category,
    required this.likes,
    required this.shares,
    required this.isHot,
    required this.isNew,
  });

  final String id;
  final String title;
  final String channelName;
  final String description;
  final String category;
  final int likes;
  final int shares;
  final bool isHot;
  final bool isNew;

  @override
  List<Object?> get props => [
    id,
    title,
    channelName,
    description,
    category,
    likes,
    shares,
    isHot,
    isNew,
  ];
}