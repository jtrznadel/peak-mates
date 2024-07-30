import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/core/services/injection_container.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/features/profile/presentation/widgets/update_avatar_selector.dart';
import 'package:peak_mates/features/profile/presentation/widgets/update_profile_button.dart';

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
                    child: UpdateAvatarSelector(
                        updatedPhoto: _updatedPhoto, userPhoto: userPhoto),
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
                BlocProvider(
                  create: (context) => sl<AuthCubit>(),
                  child: UpdateProfileButton(
                    isChanged: isChanged,
                    firstNameChanged: firstNameChanged,
                    firstNameController: _firstNameController,
                    lastNameChanged: lastNameChanged,
                    lastNameController: _lastNameController,
                    bioChanged: bioChanged,
                    bioController: _bioController,
                    cityChanged: cityChanged,
                    cityController: _cityController,
                    countryChanged: countryChanged,
                    countryController: _countryController,
                    photoChanged: photoChanged,
                    updatedPhoto: _updatedPhoto,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
