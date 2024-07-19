import 'package:equatable/equatable.dart';
import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/core/utilities/usecases.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';
import 'package:peak_mates/features/auth/domain/repositories/auth_repo.dart';

class SignIn extends UsecaseWithParams<User, SignInParams> {
  const SignIn(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<User> call(SignInParams params) => _repo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
