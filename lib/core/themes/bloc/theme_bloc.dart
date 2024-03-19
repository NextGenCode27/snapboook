import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/themes/theme_mode/light_mode.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(lightMode)) {
    on<ThemeEvent>(_onThemeEvent);
    on<AppThemeChangeEvent>(_onAppThemeChangeEvent);
  }

  FutureOr<void> _onThemeEvent(
      ThemeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoading());
  }

  FutureOr<void> _onAppThemeChangeEvent(
      AppThemeChangeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeSuccess(event.themeData));
  }
}
