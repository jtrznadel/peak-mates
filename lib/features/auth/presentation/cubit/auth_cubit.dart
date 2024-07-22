import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';
import 'package:peak_mates/features/auth/domain/usecases/sign_in.dart';
import 'package:peak_mates/features/auth/domain/usecases/sign_up.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required SignIn signIn,
    required SignUp signUp,
  })  : _signIn = signIn,
        _signUp = signUp,
        super(AuthInitial());

  final SignIn _signIn;
  final SignUp _signUp;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    final result =
        await _signIn(SignInParams(email: email, password: password));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(SignedIn(user)),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(const AuthLoading());
    final result = await _signUp(
        SignUpParams(email: email, password: password, username: username));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const SignedUp()),
    );
  }
}
