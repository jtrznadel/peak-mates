import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peak_mates/core/common/app/providers/user_provider.dart';
import 'package:peak_mates/core/common/functions/custom_snackbar.dart';
import 'package:peak_mates/core/common/widgets/image_background.dart';
import 'package:peak_mates/core/extensions/context_extension.dart';
import 'package:peak_mates/core/res/colors.dart';
import 'package:peak_mates/core/res/media_res.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';
import 'package:peak_mates/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:peak_mates/core/common/view/navigation_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();
  bool isObscured = true;
  bool _rememberMe = false;

  Future<void> _readFromStorage() async {
    final email = await storage.read(key: 'email') ?? '';
    final password = await storage.read(key: 'password') ?? '';
    final rememberMe = await storage.read(key: 'rememberMe') ?? 'false';
    setState(() {
      _rememberMe = rememberMe == 'true';
    });
    emailController.text = email;
    passwordController.text = password;
  }

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _readFromStorage();
    super.initState();
  }

  @override
  void dispose() {
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
          } else if (state is SignedIn) {
            context.read<UserProvider>().initUser(state.user as UserModel);

            Navigator.pushNamed(context, NavigationView.routeName);
          }
        },
        child: ImageBackground(
          image: MediaRes.onboardingBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Nice to see ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.lightTextColor,
                      ),
                  children: [
                    TextSpan(
                      text: 'You ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextSpan(
                      text: 'again!',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.primaryColor,
                        ),
                        hintStyle: context.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.grayLightColor,
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
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.lightTextColor,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                      autocorrect: false,
                      cursorColor: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: AppColors.primaryColor,
                        ),
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
                        hintStyle: context.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.grayLightColor,
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
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                              activeColor: AppColors.primaryColor,
                              checkColor: AppColors.grayDarkColor,
                            ),
                            Text(
                              'Remember me',
                              style:
                                  context.theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.grayLightColor,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                          ),
                        ),
                      ],
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: context.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.grayLightColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signUp');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                        ),
                        child: const Text('Sign Up Now'),
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
