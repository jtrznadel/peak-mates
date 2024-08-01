import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peak_mates/core/enums/difficulty_level.dart';
import 'package:peak_mates/core/enums/transportation.dart';
import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/trips/domain/entities/trip.dart';

class TripModel extends Trip {
  const TripModel({
    required super.id,
    required super.title,
    required super.description,
    required super.date,
    required super.areaId,
    required super.peakIds,
    required super.difficulty,
    required super.aproxDurationInHours,
    required super.maxParticipants,
    required super.createdBy,
    required super.createdAt,
    required super.transportation,
    required super.chatRoomId,
    required super.participants,
    super.notes,
  });

  factory TripModel.empty() {
    return TripModel(
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
      notes: null,
    );
  }

  TripModel copyWith({
    String? id,
    String? title,
    String? description,
    String? areaId,
    List<String>? peakIds,
    DateTime? date,
    DifficultyLevel? difficulty,
    int? aproxDurationInHours,
    int? maxParticipants,
    List<String>? participants,
    String? createdBy,
    DateTime? createdAt,
    Transportation? transportation,
    String? notes,
    String? chatRoomId,
  }) {
    return TripModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      areaId: areaId ?? this.areaId,
      peakIds: peakIds ?? this.peakIds,
      date: date ?? this.date,
      difficulty: difficulty ?? this.difficulty,
      aproxDurationInHours: aproxDurationInHours ?? this.aproxDurationInHours,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      participants: participants ?? this.participants,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      transportation: transportation ?? this.transportation,
      notes: notes ?? this.notes,
      chatRoomId: chatRoomId ?? this.chatRoomId,
    );
  }

  TripModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          title: map['title'] as String,
          description: map['description'] as String,
          areaId: map['areaId'] as String,
          peakIds: (map['peakIds'] as List).cast<String>(),
          date: map['date'] as DateTime,
          difficulty: map['difficulty'] as DifficultyLevel,
          aproxDurationInHours: map['aproxDurationInHours'] as int,
          maxParticipants: map['maxParticipants'] as int,
          participants: (map['participants'] as List).cast<String>(),
          createdBy: map['createdBy'] as String,
          createdAt: map['createdAt'] as DateTime,
          transportation: map['transportation'] as Transportation,
          notes: map['notes'] as String?,
          chatRoomId: map['chatRoomId'] as String,
        );

  DataMap toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'areaId': areaId,
        'peakIds': peakIds,
        'date': date,
        'difficulty': difficulty,
        'aproxDurationInHours': aproxDurationInHours,
        'maxParticipants': maxParticipants,
        'participants': participants,
        'createdBy': createdBy,
        'createdAt': FieldValue.serverTimestamp(),
        'transportation': transportation,
        'notes': notes,
        'chatRoomId': chatRoomId,
      };
}
