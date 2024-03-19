import 'package:flutter/material.dart';
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
                Column(
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

                //AuthButton
                AuthButton(
                  lable: 'Register',
                  icon: Icons.login,
                  onPressed: () {},
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
                          color: Theme.of(context).colorScheme.inversePrimary,
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
      ),
    );
  }
}
