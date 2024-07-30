import 'package:flutter/material.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';

class AuthPasswordField extends StatefulWidget {
  const AuthPasswordField({super.key, required this.passwordController});

  final TextEditingController passwordController;
  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.primaryColor,
        ),
        hintStyle: context.theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.grayLightColor,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          child: Icon(
            isObscured ? Icons.visibility : Icons.visibility_off,
            color: AppColors.grayLightColor,
          ),
        ),
        fillColor: AppColors.grayDarkColor.withOpacity(.5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      cursorColor: AppColors.primaryColor,
      style: context.theme.textTheme.bodyMedium!.copyWith(
        color: AppColors.lightTextColor,
      ),
      keyboardAppearance: Brightness.dark,
      autocorrect: false,
      enableSuggestions: false,
      obscureText: isObscured,
    );
  }
}
