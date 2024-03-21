import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/common/widgets/loader.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/dark_mode.dart';
import 'package:snapbook/core/themes/theme_mode/light_mode.dart';
import 'package:snapbook/core/services/shared_pref.dart';
import 'package:snapbook/features/auth/presentation/views/login_view.dart';
import 'package:snapbook/features/home/presentation/bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeView());
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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLogOut) {
          Navigator.of(context)
              .pushAndRemoveUntil(LoginView.route(), (route) => false);
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Loader();
        }

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toggle,
                  child: const Text('Change Theme'),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(HomeUserLogOutEvent());
                  },
                  child: const Text('Log Out'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
