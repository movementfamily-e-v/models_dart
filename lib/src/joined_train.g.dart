// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_train.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JoinedTrainAdapter extends TypeAdapter<JoinedTrain> {
  @override
  final int typeId = 3;

  @override
  JoinedTrain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JoinedTrain(
      fields[0] as int,
      fields[1] as bool,
      fields[2] as DateTime,
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, JoinedTrain obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.trainingId)
      ..writeByte(1)
      ..write(obj.canceled)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.ag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JoinedTrainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
