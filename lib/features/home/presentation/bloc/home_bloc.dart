import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/usecase/usecase.dart';
import 'package:snapbook/features/home/domain/usecase/home_user_logout_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUserLogoutUsecase _homeUserLogoutUsecase;
  HomeBloc({required HomeUserLogoutUsecase homeUserLogoutUsecase})
      : _homeUserLogoutUsecase = homeUserLogoutUsecase,
        super(HomeInitial()) {
    on<HomeEvent>(_onMapHomeEventToState);
    on<HomeUserLogOutEvent>(_onHomeUserLogOutEventToState);
  }

  FutureOr<void> _onMapHomeEventToState(
      HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
  }

  FutureOr<void> _onHomeUserLogOutEventToState(
      HomeUserLogOutEvent event, Emitter<HomeState> emit) async {
    final res = await _homeUserLogoutUsecase.call(NoParams());
    res.fold(
      (error) => emit(HomeFailed(message: error.message)),
      (user) => emit(HomeLogOut()),
    );
  }
}
