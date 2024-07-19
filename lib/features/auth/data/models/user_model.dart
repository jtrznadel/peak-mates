import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.uid,
    required super.email,
    required super.username,
    super.firstName,
    super.nationality,
    super.profilePicture,
    super.bio,
    super.dateOfBirth,
  });

  factory UserModel.empty() {
    return const UserModel(
      uid: 'empty_uid',
      email: 'empty_email',
      username: 'empty_username',
    );
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? username,
    String? firstName,
    String? nationality,
    String? profilePicture,
    String? bio,
    DateTime? dateOfBirth,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      nationality: nationality ?? this.nationality,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  UserModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] as String,
          email: map['email'] as String,
          username: map['username'] as String,
          firstName: map['firstName'] as String,
          nationality: map['nationality'] as String,
          profilePicture: map['profilePicture'] as String,
          bio: map['bio'] as String,
          dateOfBirth: map['dateOfBirth'] as DateTime,
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'firstName': firstName,
      'nationality': nationality,
      'profilePicture': profilePicture,
      'bio': bio,
      'dateOfBirth': dateOfBirth,
    };
  }
}
