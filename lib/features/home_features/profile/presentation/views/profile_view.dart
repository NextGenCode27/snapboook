import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/services/shared_pref.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/dark_mode.dart';
import 'package:snapbook/core/themes/theme_mode/light_mode.dart';
import 'package:snapbook/features/home/presentation/bloc/home_bloc.dart';
import 'package:snapbook/features/home_features/profile/presentation/widgets/profile_draggable_sheet.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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

    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state is ThemeSuccess) {
                return IconButton(
                  onPressed: toggle,
                  icon: state.themeData == lightMode
                      ? Icon(
                          Icons.dark_mode,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : Icon(
                          Icons.light_mode,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                );
              }
              return const SizedBox();
            },
          ),
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(HomeUserLogOutEvent());
            },
            icon: Icon(Icons.logout,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
      body: Container(
        height: size.height / 1,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          image: const DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1588&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ProfileDraggableSheet(size: size),
      ),
    );
  }
}
