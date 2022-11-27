import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'theme.dart';

const mingServerUrl = "https://ming.fly.dev/";
const kakaoNativeAppKey =
    String.fromEnvironment('KAKAO_NATIVE_APP_KEY', defaultValue: 'none');
const kakaoRestApiAppKey =
    String.fromEnvironment('KAKAO_RESTAPI_APP_KEY', defaultValue: 'none');
const authSecureHiveKey =
    String.fromEnvironment('AUTH_SECURE_HIVE_KEY', defaultValue: 'none');

const spinLoader = Center(
  child: SpinKitWave(
    color: Colors.white,
  ),
);

extension CustomThemeExtension on ThemeData {
  MingCustomTheme? mingCustomTheme() {
    return extension<MingCustomTheme>();
  }
}
