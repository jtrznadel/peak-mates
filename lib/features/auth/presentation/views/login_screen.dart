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
import 'package:peak_mates/features/auth/presentation/widgets/auth_password_field.dart';
import 'package:peak_mates/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:peak_mates/features/auth/presentation/widgets/login_button.dart';

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
                    AuthTextField(controller: emailController, hint: 'Email'),
                    const SizedBox(height: 10),
                    AuthPasswordField(passwordController: passwordController),
                  ],
                ),
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
                        style: context.theme.textTheme.bodyMedium!.copyWith(
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
              const Spacer(),
              Column(
                children: [
                  LoginButton(
                    formKey: formKey,
                    rememberMe: _rememberMe,
                    storage: storage,
                    emailController: emailController,
                    passwordController: passwordController,
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
