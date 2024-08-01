import 'package:equatable/equatable.dart';
import 'package:peak_mates/core/enums/difficulty_level.dart';
import 'package:peak_mates/core/enums/transportation.dart';

class Trip extends Equatable {
  const Trip({
    required this.id,
    required this.title,
    required this.description,
    required this.areaId,
    required this.peakIds,
    required this.date,
    required this.difficulty,
    required this.aproxDurationInHours,
    required this.maxParticipants,
    required this.participants,
    required this.createdBy,
    required this.createdAt,
    required this.transportation,
    this.notes,
    required this.chatRoomId,
  });

  factory Trip.empty() {
    return Trip(
      id: 'empty_id',
      title: 'empty_title',
      description: 'empty_description',
      areaId: 'empty_areaId',
      peakIds: const ['empty_peakId'],
      date: DateTime.now(),
      difficulty: DifficultyLevel.easy,
      aproxDurationInHours: 0,
      maxParticipants: 0,
      participants: const ['empty_participant'],
      createdBy: 'empty_createdBy',
      createdAt: DateTime.now(),
      transportation: Transportation.selfArranged,
      chatRoomId: 'empty_chatRoomId',
    );
  }

  final String id;
  final String title;
  final String description;
  final String areaId;
  final List<String> peakIds;
  final DateTime date;
  final DifficultyLevel difficulty;
  final int aproxDurationInHours;
  final int maxParticipants;
  final List<String> participants;
  final String createdBy;
  final DateTime createdAt;
  final Transportation transportation;
  final String? notes;
  final String chatRoomId;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        areaId,
        peakIds,
        date,
        difficulty,
        aproxDurationInHours,
        maxParticipants,
        participants,
        createdBy,
        createdAt,
        transportation,
        notes,
        chatRoomId,
      ];
}
