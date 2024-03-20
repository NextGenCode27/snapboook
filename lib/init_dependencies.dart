import 'package:get_it/get_it.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';

GetIt serviceLocator = GetIt.instance;

void initDependencies() async {
  _intiTheme();
}

void _intiTheme() {
  serviceLocator.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
}
