import 'package:flutter/material.dart';
import 'package:snapbook/features/auth/presentation/widgets/auth_button.dart';
import 'package:snapbook/features/auth/presentation/widgets/auth_textfield.dart';

class ForgotView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const ForgotView());
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

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
                      'FORGOT SNAPBOOOK PASSWORD',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),

                //Email  Input
                Form(
                  key: _formKey,
                  child: AuthTextField(
                    controller: emailController,
                    hintText: 'EMAIL',
                    obScureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                //AuthButton
                AuthButton(
                  lable: 'Send Email',
                  icon: Icons.login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),

                //Bck to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Back to',
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
