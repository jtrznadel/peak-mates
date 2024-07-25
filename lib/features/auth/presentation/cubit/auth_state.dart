part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class SignedIn extends AuthState {
  final LocalUser user;

  const SignedIn(this.user);

  @override
  List<Object> get props => [user];
}

final class SignedUp extends AuthState {
  const SignedUp();
}

final class UpdatingUser extends AuthState {
  const UpdatingUser();
}

final class UserUpdated extends AuthState {
  const UserUpdated();
}

final class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}
