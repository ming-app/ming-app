import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming_api/ming_api.dart';
import 'package:uuid/uuid.dart';

import '../model/user.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(
    this._auth,
    this._api,
  ) : super(UserProfileInitial());

  final MingAuth _auth;
  final MingApiRepository _api;

  void initialize() {
    emit(UserProfileInitial());
  }

  Future<void> getUserProfile() async {
    emit(UserProfileUpdating());

    if (!(await _auth.isLogIn)) {
      emit(UserProfileNotLoggedIn());
      return;
    }

    try {
      final token = await _auth.token;
      final response =
          (await _api.client.getUserDetailInfo(withBearer(token))).result;

      final user = response == null
          ? UserProfile.empty()
          : UserProfile.fromUserDetailInfoResponse(response);

      Log.d('User profile fetched');
      emit(UserProfileFetched(user));
    } catch (e) {
      Log.e('user profile fetch failed', e);
      emit(UserProfileError("$e"));
    }
  }

  Future<void> updateUserProfile(UserProfile user) async {
    emit(UserProfileUpdating());

    try {
      // todo: handle user profile update
      Log.d('User profile updated');
      getUserProfile();
    } catch (e) {
      Log.e('user profile updating failed', e);
      emit(UserProfileError("$e"));
    }
  }

  void nameChanged(String value) {
    UserProfile original;

    if (state is UserProfileEditing) {
      original = (state as UserProfileEditing).original;
    } else {
      original = state.user;
    }

    emit(UserProfileEditing(
      state.key,
      original,
      state.user.copyWith(name: value),
    ));
  }

  void snsUrlChanged(String value) {
    UserProfile original;

    if (state is UserProfileEditing) {
      original = (state as UserProfileEditing).original;
    } else {
      original = state.user;
    }

    emit(UserProfileEditing(
      state.key,
      original,
      state.user.copyWith(snsUrl: value),
    ));
  }

  void cancelEditing() {
    if (state is UserProfileEditing) {
      emit(UserProfileFetched((state as UserProfileEditing).original));
    }
  }
}
