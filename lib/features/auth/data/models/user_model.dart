import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';

class UserModel extends LocalUser {
  const UserModel({
    required super.uid,
    required super.email,
    required super.username,
    super.firstName,
    super.lastName,
    super.nationality,
    super.city,
    super.profilePicture,
    super.bio,
    super.dateOfBirth,
    super.verified,
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
    String? lastName,
    String? nationality,
    String? city,
    String? profilePicture,
    String? bio,
    DateTime? dateOfBirth,
    bool? verified,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nationality: nationality ?? this.nationality,
      city: city ?? this.city,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      verified: verified ?? this.verified,
    );
  }

  UserModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] as String,
          email: map['email'] as String,
          username: map['username'] as String,
          firstName: map['firstName'] as String?,
          lastName: map['lastName'] as String?,
          nationality: map['nationality'] as String?,
          city: map['city'] as String?,
          profilePicture: map['profilePicture'] as String?,
          bio: map['bio'] as String?,
          dateOfBirth: map['dateOfBirth'] as DateTime?,
          verified: map['verified'] as bool?,
        );

  DataMap toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'nationality': nationality,
      'city': city,
      'profilePicture': profilePicture,
      'bio': bio,
      'dateOfBirth': dateOfBirth,
      'verified': verified,
    };
  }
}


//  pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '10.18.0'
