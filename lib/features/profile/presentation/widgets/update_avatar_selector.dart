import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';

class UpdateAvatarSelector extends StatelessWidget {
  const UpdateAvatarSelector({
    super.key,
    required File? updatedPhoto,
    required this.userPhoto,
  }) : _updatedPhoto = updatedPhoto;

  final File? _updatedPhoto;
  final userPhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: _updatedPhoto != null
              ? AssetImage(_updatedPhoto.path)
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
    );
  }
}
