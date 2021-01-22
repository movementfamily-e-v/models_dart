// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JoinedEventAdapter extends TypeAdapter<JoinedEvent> {
  @override
  final int typeId = 2;

  @override
  JoinedEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JoinedEvent(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
    )..date = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, JoinedEvent obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.eventId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JoinedEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
