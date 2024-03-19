import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/dark_mode.dart';
import 'package:snapbook/core/themes/theme_mode/light_mode.dart';
import 'package:snapbook/services/shared_pref.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDarkMode = false;

  toggle() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      context.read<ThemeBloc>().add(AppThemeChangeEvent(darkMode));
      SharedPref().setBool(key: 'isDarkMode', value: isDarkMode);
    } else if (!isDarkMode) {
      context.read<ThemeBloc>().add(AppThemeChangeEvent(lightMode));
      SharedPref().setBool(key: 'isDarkMode', value: isDarkMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: toggle,
        child: const Text('Change Theme'),
      ),
    ));
  }
}
