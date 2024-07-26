import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peak_mates/core/common/functions/custom_snackbar.dart';
import 'package:peak_mates/core/enums/update_user.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/features/auth/domain/entities/user.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/features/profile/presentation/refactors/profile_body.dart';
import 'package:peak_mates/features/profile/presentation/refactors/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future<void> imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _photo = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorDark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                imgFromGallery();
              },
              icon: const Icon(Icons.photo_camera)),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              // if (_photo == null) {
              //   CustomSnackbar.show(context, 'Please select a photo');
              //   return;
              // }
              // final userData = _photo;
              // context.read<AuthCubit>().updateUser(
              //     action: UpdateUserAction.profilePicture, userData: userData);
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(
              height: 15,
            ),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}
