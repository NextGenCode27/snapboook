import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/common/widgets/loader.dart';
import 'package:snapbook/core/utils/show_snackbar.dart';
import 'package:snapbook/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:snapbook/features/auth/presentation/views/profile_picture_upload_view.dart';
import 'package:snapbook/features/auth/presentation/widgets/auth_button.dart';
import 'package:snapbook/features/auth/presentation/widgets/auth_textfield.dart';

class RegisterView extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const RegisterView());
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                ProfilePictureUploadView.route(), (route) => false);
          }
          if (state is AuthFailed) {
            showSnackbar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return SingleChildScrollView(
            child: Center(
              child: Container(
                height: size.height,
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Auth Logo
                    Column(
                      children: [
                        Icon(
                          Icons.lock_open,
                          size: 75,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //Message Auth Slogan
                        Text(
                          'REGISTER TO SNAPBOOOK',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),

                    //Email And Password Input
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AuthTextField(
                            controller: usernameController,
                            hintText: 'USERNAME',
                            obScureText: false,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextField(
                            controller: emailController,
                            hintText: 'EMAIL',
                            obScureText: false,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextField(
                            controller: phoneController,
                            hintText: 'PHONE',
                            obScureText: false,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextField(
                            controller: passwordController,
                            hintText: 'PASSWORD',
                            obScureText: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ],
                      ),
                    ),

                    //AuthButton
                    AuthButton(
                      lable: 'Register',
                      icon: Icons.login,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthRegisterEvent(
                                  userName: usernameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  phone: phoneController.text.trim(),
                                  photoUrl: '',
                                ),
                              );
                        }
                      },
                    ),
                    //Not a member? sing up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            letterSpacing: 2.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Login.',
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
