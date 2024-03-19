import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/dark_mode.dart';
import 'package:snapbook/core/themes/theme_mode/light_mode.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          if (isDarkMode == true) {
            context.read<ThemeBloc>().add(AppThemeChangeEvent(darkMode));
            isDarkMode = false;
          } else if (isDarkMode == false) {
            context.read<ThemeBloc>().add(AppThemeChangeEvent(lightMode));
            isDarkMode = true;
          }
        },
        child: const Text('Change Theme'),
      ),
    ));
  }
}
