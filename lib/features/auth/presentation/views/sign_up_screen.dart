import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_mates/core/common/functions/custom_snackbar.dart';
import 'package:peak_mates/core/common/widgets/image_background.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/core/res/string_res.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/features/auth/presentation/views/login_screen.dart';

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
  bool isObscured = true;

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
                    color: AppColors.lightColor,
                  ),
                  children: [
                    TextSpan(
                        text: StringRes.mate,
                        style: context.theme.textTheme.titleLarge),
                    TextSpan(
                      text: '!',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        color: AppColors.lightColor,
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
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                      style: context.theme.textTheme.bodyMedium,
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      style: context.theme.textTheme.bodyMedium,
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                          child: Icon(
                            isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.grayLightColor,
                          ),
                        ),
                      ),
                      style: context.theme.textTheme.bodyMedium,
                      keyboardAppearance: Brightness.dark,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: isObscured,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signUp(
                                username: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: context.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.grayDarkColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
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
