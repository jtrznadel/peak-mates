import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/enums/update_user.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';
import 'package:peak_mates/features/auth/domain/usecases/sign_in.dart';
import 'package:peak_mates/features/auth/domain/usecases/sign_up.dart';
import 'package:peak_mates/features/auth/domain/usecases/update_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required SignIn signIn,
    required SignUp signUp,
    required UpdateUser updateUser,
  })  : _signIn = signIn,
        _signUp = signUp,
        _updateUser = updateUser,
        super(AuthInitial());

  final SignIn _signIn;
  final SignUp _signUp;
  final UpdateUser _updateUser;

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

  Future<void> updateUser({
    required Map<UpdateUserAction, dynamic> updates,
  }) async {
    emit(const UpdatingUser());
    List<Future> updateFutures = [];
    updates.forEach((action, userData) {
      updateFutures.add(
          _updateUser(UpdateUserParams(action: action, userData: userData)));
    });
    final result = await Future.wait(updateFutures);

    if (result.any((result) => result.isLeft())) {
      emit(const AuthError('One or more updates failed'));
    } else {
      emit(const UserUpdated());
    }
  }
}
