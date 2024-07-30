import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required bool rememberMe,
    required this.storage,
    required this.emailController,
    required this.passwordController,
  }) : _rememberMe = rememberMe;

  final GlobalKey<FormState> formKey;
  final bool _rememberMe;
  final FlutterSecureStorage storage;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.currentUser?.reload();
          if (formKey.currentState!.validate()) {
            if (_rememberMe) {
              storage.write(
                key: 'email',
                value: emailController.text.trim(),
              );
              storage.write(
                key: 'password',
                value: passwordController.text.trim(),
              );
              storage.write(
                key: 'rememberMe',
                value: 'true',
              );
            } else {
              storage.delete(key: 'email');
              storage.delete(key: 'password');
              storage.write(key: 'rememberMe', value: 'false');
            }
            context.read<AuthCubit>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(
          'Login',
          style: context.theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.grayDarkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
