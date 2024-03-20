import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.lable,
    required this.onPressed,
    required this.icon,
  });
  final String lable;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        fixedSize: Size(size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      label: Text(
        lable,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
