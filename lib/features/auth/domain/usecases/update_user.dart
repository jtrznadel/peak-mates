import 'package:equatable/equatable.dart';
import 'package:peak_mates/core/enums/update_user.dart';
import 'package:peak_mates/core/utilities/typedefs.dart';
import 'package:peak_mates/core/utilities/usecases.dart';
import 'package:peak_mates/features/auth/domain/repositories/auth_repo.dart';

class UpdateUser extends FutureUsecaseWithParams<void, UpdateUserParams> {
  const UpdateUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(UpdateUserParams params) => _repo.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({required this.action, required this.userData});

  final UpdateUserAction action;
  final dynamic userData;

  @override
  List<Object?> get props => [action, userData];
}
