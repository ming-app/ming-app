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

  void onEditStateChange(UserProfileEditingType type) {
    emit(UserProfileEditing(type, state.user));
  }

  Future<void> updateUserProfile({
    String? address,
    String? imageId,
    String? introduction,
    String? snsUrl,
    String? birthday,
    UserGender? gender,
  }) async {
    if (address == null &&
        imageId == null &&
        introduction == null &&
        snsUrl == null &&
        birthday == null &&
        gender == null) {
      Log.w("There are no update, skipping");
      return;
    }

    var user = state.user;

    emit(UserProfileUpdating());

    var request = UpdateUserRequest(
      address: address ?? user.address,
      imageId: imageId ?? user.imageId,
      introduction: introduction ?? user.introduction,
      snsUrl: snsUrl ?? user.snsUrl,
      birthday: birthday ?? user.birthday,
      gender: gender ?? user.gender,
    );

    try {
      // todo: handle user profile update
      final token = await _auth.token;
      await _api.client.updateUserDetailInfo(withBearer(token), request);

      Log.d('User profile updated');
      getUserProfile();
    } catch (e) {
      Log.e('user profile updating failed', e);
      emit(UserProfileError("$e"));
    }
  }

  Future<void> logout() async {
    try {
      await _auth.logout();
    } catch (e) {
      Log.e("User logout failed", e);
      emit(UserProfileError("$e"));
    }

    emit(UserProfileNotLoggedIn());
  }
}
