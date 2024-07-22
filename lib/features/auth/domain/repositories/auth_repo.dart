import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<User> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String password,
    required String username,
  });
}
