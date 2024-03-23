import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/features/home_features/profile/domain/usecase/upload_bio_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UploadBioUsecase _uploadBioUsecase;
  ProfileBloc({required UploadBioUsecase uploadBioUsecase})
      : _uploadBioUsecase = uploadBioUsecase,
        super(ProfileInitial()) {
    on<ProfileEvent>(_mapProfileEventToState);
    on<UpdateProfileBioEvent>(_mapUpdateProfileBioEventToState);
  }

  FutureOr<void> _mapProfileEventToState(
      ProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
  }

  FutureOr<void> _mapUpdateProfileBioEventToState(
      UpdateProfileBioEvent event, Emitter<ProfileState> emit) async {
    final res = await _uploadBioUsecase.call(UploadBioParams(bio: event.bio));
    res.fold(
      (error) => emit(ProfileFailed(message: error.message)),
      (bio) {
        emit(ProfileSuccess());
      },
    );
  }
}
