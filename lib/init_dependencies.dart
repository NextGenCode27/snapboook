import 'package:get_it/get_it.dart';
import 'package:snapbook/core/secrets/app_secrets.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt serviceLocator = GetIt.instance;

void initDependencies() async {
  _intiTheme();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );
}

void _intiTheme() {
  serviceLocator.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
}
