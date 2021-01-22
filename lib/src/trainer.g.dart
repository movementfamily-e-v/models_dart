// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainerAdapter extends TypeAdapter<Trainer> {
  @override
  final int typeId = 9;

  @override
  Trainer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Trainer(
      fields[0] as int,
      fields[1] as User,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Trainer obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.imageId)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.shortDescription)
      ..writeByte(3)
      ..write(obj.mainText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
