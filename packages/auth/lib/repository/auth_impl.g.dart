// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthHiveObjectAdapter extends TypeAdapter<AuthHiveObject> {
  @override
  final int typeId = 1;

  @override
  AuthHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthHiveObject(
      accessToken: fields[0] as String,
      refreshToken: fields[1] as String,
      expiresIn: fields[3] as int,
      refreshTokenExpiresIn: fields[4] as int,
      tokenType: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthHiveObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.tokenType)
      ..writeByte(3)
      ..write(obj.expiresIn)
      ..writeByte(4)
      ..write(obj.refreshTokenExpiresIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
