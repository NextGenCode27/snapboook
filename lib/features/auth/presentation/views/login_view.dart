import 'package:flutter/material.dart';
import 'package:snapbook/features/auth/presentation/views/forgot_view.dart';
import 'package:snapbook/features/auth/presentation/views/register_view.dart';
import 'package:snapbook/features/auth/presentation/widgets/auth_button.dart';
import 'package:snapbook/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:snapbook/features/home/presentation/views/home_view.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
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
                      'SIGN IN TO SNAPBOOOK',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        controller: passwordController,
                        hintText: 'PASSWORD',
                        obScureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(ForgotView.route());
                        },
                        child: Text(
                          'Forgot?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 14,
                            letterSpacing: 2.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //AuthButton
                AuthButton(
                  lable: 'Login',
                  icon: Icons.login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                          HomeView.route(), (route) => false);
                    }
                  },
                ),
                //Not a member? sing up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        letterSpacing: 2.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(RegisterView.route());
                      },
                      child: Text(
                        'Register.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
