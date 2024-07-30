import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/common/functions/custom_snackbar.dart';
import 'package:peak_mates/core/enums/update_user.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({
    super.key,
    required this.isChanged,
    required this.firstNameChanged,
    required TextEditingController firstNameController,
    required this.lastNameChanged,
    required TextEditingController lastNameController,
    required this.bioChanged,
    required TextEditingController bioController,
    required this.cityChanged,
    required TextEditingController cityController,
    required this.countryChanged,
    required TextEditingController countryController,
    required this.photoChanged,
    required File? updatedPhoto,
  })  : _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _bioController = bioController,
        _cityController = cityController,
        _countryController = countryController,
        _updatedPhoto = updatedPhoto;

  final bool isChanged;
  final bool firstNameChanged;
  final TextEditingController _firstNameController;
  final bool lastNameChanged;
  final TextEditingController _lastNameController;
  final bool bioChanged;
  final TextEditingController _bioController;
  final bool cityChanged;
  final TextEditingController _cityController;
  final bool countryChanged;
  final TextEditingController _countryController;
  final bool photoChanged;
  final File? _updatedPhoto;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserUpdated) {
          Navigator.of(context).pop();
          CustomSnackbar.show(context, 'Profile updated successfully');
        }
      },
      builder: (context, state) {
        if (state is UpdatingUser) {
          return const CircularProgressIndicator();
        } else if (state is AuthError) {
          return Text(state.message);
        } else {
          return isChanged
              ? ElevatedButton(
                  onPressed: () {
                    Map<UpdateUserAction, dynamic> updates = {};
                    if (firstNameChanged) {
                      updates[UpdateUserAction.firstName] =
                          _firstNameController.text;
                    }
                    if (lastNameChanged) {
                      updates[UpdateUserAction.lastName] =
                          _lastNameController.text;
                    }
                    if (bioChanged) {
                      updates[UpdateUserAction.bio] = _bioController.text;
                    }
                    if (cityChanged) {
                      updates[UpdateUserAction.city] = _cityController.text;
                    }
                    if (countryChanged) {
                      updates[UpdateUserAction.nationality] =
                          _countryController.text;
                    }
                    if (photoChanged) {
                      updates[UpdateUserAction.profilePicture] = _updatedPhoto;
                    }

                    context.read<AuthCubit>().updateUser(updates: updates);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(context.width, 50),
                  ),
                  child: const Text(
                    'Update Profile',
                  ),
                )
              : const SizedBox();
        }
      },
    );
  }
}
