import 'package:equatable/equatable.dart';
import 'package:peak_mates/core/enums/difficulty_level.dart';

class Peak extends Equatable {
  final String id;
  final String areaId;
  final String name;
  final String description;
  final int elevation;
  final DifficultyLevel difficulty;
  final String imageUrl;

  const Peak({
    required this.id,
    required this.areaId,
    required this.name,
    required this.description,
    required this.elevation,
    required this.difficulty,
    required this.imageUrl,
  });

  factory Peak.empty() {
    return const Peak(
      id: 'empty_id',
      areaId: 'empty_areaId',
      name: 'empty_name',
      description: 'empty_description',
      elevation: 0,
      difficulty: DifficultyLevel.easy,
      imageUrl: 'empty_imageUrl',
    );
  }

  @override
  List<Object?> get props =>
      [id, areaId, name, description, elevation, difficulty, imageUrl];
}
