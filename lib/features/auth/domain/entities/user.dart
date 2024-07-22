import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.uid,
    required this.email,
    required this.username,
    this.firstName,
    this.nationality,
    this.profilePicture,
    this.bio,
    this.dateOfBirth,
  });

  factory User.empty() {
    return const User(
      uid: 'empty_uid',
      email: 'empty_email',
      username: 'empty_username',
    );
  }

  final String uid;
  final String email;
  final String username;
  final String? firstName;
  final String? nationality;
  final String? profilePicture;
  final String? bio;
  final DateTime? dateOfBirth;

  @override
  List<Object?> get props => [uid];
}
