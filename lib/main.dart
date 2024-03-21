import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/bloc_observer.dart';
import 'package:snapbook/core/common/cubit/cubit/app_user_cubit.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/dark_mode.dart';
import 'package:snapbook/core/themes/theme_mode/light_mode.dart';
import 'package:snapbook/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:snapbook/features/auth/presentation/views/login_view.dart';
import 'package:snapbook/core/services/shared_pref.dart';
import 'package:snapbook/features/home/presentation/views/home_view.dart';
import 'package:snapbook/init_dependencies.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  final isDarkMode = await SharedPref().getBool('isDarkMode') ?? false;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<ThemeBloc>()),
        BlocProvider(create: (context) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
      ],
      child: MyApp(isDarkMode: isDarkMode),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthUserIsLoggedInEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ThemeInitial) {
          if (widget.isDarkMode == true) {
            context.read<ThemeBloc>().add(AppThemeChangeEvent(darkMode));
          } else if (widget.isDarkMode == false) {
            context.read<ThemeBloc>().add(AppThemeChangeEvent(lightMode));
          }
        }
        if (state is ThemeSuccess) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'S N A P B O O K',
            theme: state.themeData,
            darkTheme: darkMode,
            home: BlocSelector<AppUserCubit, AppUserState, bool>(
              selector: (state) {
                return state is AppUserLoggedIn;
              },
              builder: (context, state) {
                if (state) {
                  return const HomeView();
                } else {
                  return const LoginView();
                }
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
