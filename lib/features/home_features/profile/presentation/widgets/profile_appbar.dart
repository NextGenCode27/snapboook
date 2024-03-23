import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/light_mode.dart';
import 'package:snapbook/features/home/presentation/bloc/home_bloc.dart';

AppBar profileAppBar(
  BuildContext context, {
  required VoidCallback themeToggle,
  required VoidCallback onPressedEditButton,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
        onPressed: onPressedEditButton,
        icon: const Icon(Icons.edit),
      ),
      BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeSuccess) {
            return IconButton(
              onPressed: themeToggle,
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
        icon:
            Icon(Icons.logout, color: Theme.of(context).colorScheme.secondary),
      ),
    ],
  );
}
