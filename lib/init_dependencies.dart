import 'package:get_it/get_it.dart';
import 'package:snapbook/core/common/cubit/cubit/app_user_cubit.dart';
import 'package:snapbook/core/secrets/app_secrets.dart';
import 'package:snapbook/core/themes/bloc/theme_bloc.dart';
import 'package:snapbook/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:snapbook/features/auth/data/repository/auth_repository_impl.dart';
import 'package:snapbook/features/auth/domain/repository/auth_repository.dart';
import 'package:snapbook/features/auth/domain/usecase/current_user_usecase.dart';
import 'package:snapbook/features/auth/domain/usecase/login_usecase.dart';
import 'package:snapbook/features/auth/domain/usecase/register_usecase.dart';
import 'package:snapbook/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _intiTheme();
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );

  serviceLocator.registerLazySingleton<SupabaseClient>(() => supabase.client);

  serviceLocator.registerLazySingleton<AppUserCubit>(() => AppUserCubit());
}

void _intiTheme() {
  serviceLocator.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerFactory<LoginUsecase>(
      () => LoginUsecase(serviceLocator()),
    )
    ..registerFactory<RegisterUsecase>(
      () => RegisterUsecase(serviceLocator()),
    )
    ..registerFactory<CurrentUserUsecase>(
      () => CurrentUserUsecase(serviceLocator()),
    )
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        loginUsecase: serviceLocator(),
        registerUsecase: serviceLocator(),
        currentUserUsecase: serviceLocator(),
      ),
    );
}
