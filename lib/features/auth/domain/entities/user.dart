import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.username,
    this.firstName,
    this.lastName,
    this.nationality,
    this.city,
    this.profilePicture,
    this.bio,
    this.dateOfBirth,
    this.verified,
  });

  factory LocalUser.empty() {
    return const LocalUser(
      uid: 'empty_uid',
      email: 'empty_email',
      username: 'empty_username',
    );
  }

  final String uid;
  final String email;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? nationality;
  final String? city;
  final String? profilePicture;
  final String? bio;
  final DateTime? dateOfBirth;
  final bool? verified;

  @override
  List<Object?> get props => [
        uid,
        email,
        username,
        profilePicture,
        firstName,
        lastName,
        nationality,
        city,
        bio,
        dateOfBirth,
        verified
      ];
}
