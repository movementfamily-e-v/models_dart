// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 11;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      birthdate: fields[4] as DateTime,
      email: fields[5] as String,
      fullName: fields[6] as String,
      name: fields[1] as String,
      loggedIn: fields[7] as bool,
      newsLetter: fields[8] as bool,
      userRole: fields[2] as UserRole,
      authKey: fields[3] as String,
      passwort: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(2)
      ..write(obj.userRole)
      ..writeByte(3)
      ..write(obj.authKey)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.birthdate)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.fullName)
      ..writeByte(7)
      ..write(obj.loggedIn)
      ..writeByte(8)
      ..write(obj.newsLetter)
      ..writeByte(9)
      ..write(obj.passwort);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
