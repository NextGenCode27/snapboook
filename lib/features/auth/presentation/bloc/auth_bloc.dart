import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/common/cubit/cubit/app_user_cubit.dart';
import 'package:snapbook/core/common/entity/user_enitity.dart';
import 'package:snapbook/core/usecase/usecase.dart';
import 'package:snapbook/features/auth/domain/usecase/current_user_usecase.dart';
import 'package:snapbook/features/auth/domain/usecase/login_usecase.dart';
import 'package:snapbook/features/auth/domain/usecase/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final CurrentUserUsecase _currentUserUsecase;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
    required CurrentUserUsecase currentUserUsecase,
    required AppUserCubit appUserCubit,
  })  : _loginUsecase = loginUsecase,
        _registerUsecase = registerUsecase,
        _currentUserUsecase = currentUserUsecase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>(_mapAuthEventToState);
    on<AuthRegisterEvent>(_mapAuthRegisterEventToState);
    on<AuthLoginEvent>(_mapAuthLoginEventToState);
    on<AuthUserIsLoggedInEvent>(_mapAuthUserLoggedInEvent);
  }

  FutureOr<void> _mapAuthEventToState(
      AuthEvent event, Emitter<AuthState> emit) {
    emit(AuthLoading());
  }

  FutureOr<void> _mapAuthRegisterEventToState(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    final res = await _registerUsecase.call(
      RegisterParams(
        userName: event.userName,
        email: event.email,
        password: event.password,
        phone: event.phone,
        photoUrl: event.photoUrl,
      ),
    );

    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (user) {
        _appUserCubit.updateUser(user);
        emit(AuthSuccess(userEntity: user));
      },
    );
  }

  FutureOr<void> _mapAuthLoginEventToState(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    final res = await _loginUsecase.call(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (user) {
        _appUserCubit.updateUser(user);
        emit(AuthSuccess(userEntity: user));
      },
    );
  }

  FutureOr<void> _mapAuthUserLoggedInEvent(
      AuthUserIsLoggedInEvent event, Emitter<AuthState> emit) async {
    final res = await _currentUserUsecase.call(NoParams());

    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (user) {
        _appUserCubit.updateUser(user);
        emit(AuthSuccess(userEntity: user));
      },
    );
  }
}
