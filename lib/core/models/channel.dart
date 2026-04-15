import 'package:equatable/equatable.dart';

class Channel extends Equatable {
  const Channel({
    required this.id,
    required this.name,
    required this.owner,
    required this.description,
    required this.followers,
  });

  final String id;
  final String name;
  final String owner;
  final String description;
  final int followers;

  @override
  List<Object?> get props => [id, name, owner, description, followers];
}