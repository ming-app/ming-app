import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final int refreshTokenExpiresIn;

  AuthToken(
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.refreshTokenExpiresIn,
  );

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
