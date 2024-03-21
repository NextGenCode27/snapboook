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
        super(HomeInitial(currentIndex: 0)) {
    on<HomeEvent>(_onMapHomeEventToState);
    on<HomeUserLogOutEvent>(_onMapHomeUserLogOutEventToState);
    on<HomeCurrentIndexEvent>(_onMapHomeCurrentIndexEndex);
  }

  FutureOr<void> _onMapHomeEventToState(
      HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
  }

  FutureOr<void> _onMapHomeCurrentIndexEndex(
      HomeCurrentIndexEvent event, Emitter<HomeState> emit) async {
    emit(HomeSuccess(currentIndex: event.currentIndex));
  }

  FutureOr<void> _onMapHomeUserLogOutEventToState(
      HomeUserLogOutEvent event, Emitter<HomeState> emit) async {
    final res = await _homeUserLogoutUsecase.call(NoParams());
    res.fold(
      (error) => emit(HomeFailed(message: error.message)),
      (user) => emit(HomeLogOut()),
    );
  }
}
