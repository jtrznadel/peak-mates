import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peak_mates/core/common/functions/custom_snackbar.dart';
import 'package:peak_mates/core/enums/update_user.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String routeName = '/update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  late dynamic userPhoto;
  File? _updatedPhoto;
  final ImagePicker _picker = ImagePicker();

  Future<void> imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _updatedPhoto = File(pickedFile.path);
      });
    }
  }

  bool get firstNameChanged =>
      _firstNameController.text != context.currentUser!.firstName;

  bool get lastNameChanged =>
      _lastNameController.text != context.currentUser!.lastName;

  bool get cityChanged => _cityController.text != context.currentUser!.city;

  bool get countryChanged =>
      _countryController.text != context.currentUser!.nationality;

  bool get bioChanged => _bioController.text != context.currentUser!.bio;

  bool get photoChanged => _updatedPhoto != null;

  bool get isChanged =>
      firstNameChanged ||
      lastNameChanged ||
      cityChanged ||
      countryChanged ||
      bioChanged ||
      photoChanged;

  @override
  void initState() {
    _firstNameController.text = context.currentUser!.firstName!;
    _lastNameController.text = context.currentUser!.lastName!;
    _cityController.text = context.currentUser!.city!;
    _countryController.text = context.currentUser!.nationality!;
    _bioController.text = context.currentUser!.bio!;
    userPhoto = context.currentUser!.profilePicture != null
        ? NetworkImage(context.currentUser!.profilePicture!)
        : const AssetImage(MediaRes.defaultAvatar);
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Update Profile'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: context.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.width * .4,
                  height: context.width * .4,
                  child: GestureDetector(
                    onTap: imgFromGallery,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: _updatedPhoto != null
                              ? AssetImage(_updatedPhoto!.path)
                              : userPhoto,
                          radius: 100,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: context.width * .4,
                            height: context.width * .4,
                            color: Colors.black.withOpacity(.5),
                            child: const Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _firstNameController,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _lastNameController,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _bioController,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                  ),
                  maxLines: 3,
                  style: context.theme.textTheme.bodyMedium,
                  maxLength: 115,
                  buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      required maxLength}) {
                    return Text(
                      '$currentLength of $maxLength',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        color: currentLength < maxLength!
                            ? Colors.grey
                            : Colors.red,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _countryController,
                        decoration: const InputDecoration(
                          labelText: 'Country',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is UserUpdated) {
                      Navigator.of(context).pop();
                      CustomSnackbar.show(
                          context, 'Profile updated successfully');
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
                                  updates[UpdateUserAction.bio] =
                                      _bioController.text;
                                }
                                if (cityChanged) {
                                  updates[UpdateUserAction.city] =
                                      _cityController.text;
                                }
                                if (countryChanged) {
                                  updates[UpdateUserAction.nationality] =
                                      _countryController.text;
                                }
                                if (photoChanged) {
                                  updates[UpdateUserAction.profilePicture] =
                                      _updatedPhoto;
                                }

                                context
                                    .read<AuthCubit>()
                                    .updateUser(updates: updates);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                minimumSize: Size(context.width, 50),
                              ),
                              child: Text(
                                'Update Profile',
                                style: context.theme.textTheme.bodyMedium!
                                    .copyWith(
                                  color: AppColors.bgColorDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
