// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServerImageAdapter extends TypeAdapter<ServerImage> {
  @override
  final int typeId = 6;

  @override
  ServerImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServerImage(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ServerImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.filePath)
      ..writeByte(2)
      ..write(obj.extraIdentifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
