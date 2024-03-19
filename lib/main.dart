import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/dark_mode.dart';
import 'package:snapbook/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeInitial) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'S N A P B O O K',
              theme: state.themeData,
              darkTheme: darkMode,
              home: const HomeView(),
            );
          }
          if (state is ThemeSuccess) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'S N A P B O O K',
              theme: state.themeData,
              darkTheme: darkMode,
              home: const HomeView(),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
