import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/common/functions/custom_snackbar.dart';
import 'package:peak_mates/core/common/widgets/image_background.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/core/res/string_res.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/features/auth/presentation/views/login_screen.dart';
import 'package:peak_mates/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:peak_mates/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:peak_mates/features/auth/presentation/widgets/sign_up_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pushNamed(context, '/selection');
          },
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          if (state is AuthError) {
            CustomSnackbar.show(context, state.message);
          } else if (state is SignedUp) {
            CustomSnackbar.show(context, 'Signed up successfully');
            Navigator.pushNamed(context, LoginScreen.routeName);
          }
        },
        child: ImageBackground(
          image: MediaRes.onboardingBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: StringRes.signUpLetsBecome,
                  style: context.theme.textTheme.titleLarge!.copyWith(
                    color: AppColors.lightTextColor,
                  ),
                  children: [
                    TextSpan(
                        text: StringRes.mate,
                        style: context.theme.textTheme.titleLarge),
                    TextSpan(
                      text: '!',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        color: AppColors.lightTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      controller: usernameController,
                      hint: 'Username',
                    ),
                    const SizedBox(height: 10),
                    AuthTextField(
                      controller: emailController,
                      hint: 'Email',
                    ),
                    const SizedBox(height: 10),
                    AuthPasswordField(
                      passwordController: passwordController,
                    )
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  SignUpButton(
                    formKey: formKey,
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: context.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.grayLightColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                        ),
                        child: const Text('Login Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
