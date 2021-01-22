// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServerInformationAdapter extends TypeAdapter<ServerInformation> {
  @override
  final int typeId = 7;

  @override
  ServerInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServerInformation(
      gitInfo: fields[0] as String,
      lastUpdate: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ServerInformation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.gitInfo)
      ..writeByte(1)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
