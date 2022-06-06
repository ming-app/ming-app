import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming_api/model/model.dart';
import 'package:ming_api/repository/ming_api_repository.dart';
import 'package:uuid/uuid.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(
    this._auth,
    this._api,
  ) : super(UserProfileInitial());

  final AuthenticationRepository _auth;
  final MingApiRepository _api;

  void initialize() {
    emit(UserProfileInitial());
  }

  Future<void> getUserProfile() async {
    emit(UserProfileUpdating());

    if ((await _auth.user.first).isEmpty) {
      emit(UserProfileNotLoggedIn());
      return;
    }

    try {
      final token = await _auth.idToken;
      final user = await _api.getUserInfo(token);
      Log.d('User profile fetched');
      emit(UserProfileFetched(user));
    } catch (e) {
      Log.e('user profile fetch failed', e);
      emit(UserProfileError("$e"));
    }
  }

  Future<void> updateUserProfile(User user) async {
    emit(UserProfileUpdating());

    try {
      final token = await _auth.idToken;
      await _api.updateUserInfo(token, user);
      Log.d('User profile updated');
      getUserProfile();
    } catch (e) {
      Log.e('user profile updating failed', e);
      emit(UserProfileError("$e"));
    }
  }

  void nameChanged(String value) {
    User original;

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
    User original;

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
