// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingAdapter extends TypeAdapter<Training> {
  @override
  final int typeId = 10;

  @override
  Training read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Training(
      ageFrom: fields[1] as int,
      ageTill: fields[2] as int,
      validSince: fields[4] as DateTime,
      validTill: fields[3] as DateTime,
      isAG: fields[7] as bool,
      name: fields[8] as String,
      shortDescription: fields[9] as String,
      timeFrom: fields[5] as DateTime,
      timeTill: fields[6] as DateTime,
      weekDay: fields[11] as WeekDay,
      id: fields[0] as int,
      trainers: (fields[12] as List)?.cast<Trainer>(),
      locationId: fields[14] as int,
      trainings: (fields[13] as List)?.cast<TrainingDate>(),
    );
  }

  @override
  void write(BinaryWriter writer, Training obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ageFrom)
      ..writeByte(2)
      ..write(obj.ageTill)
      ..writeByte(3)
      ..write(obj.validTill)
      ..writeByte(4)
      ..write(obj.validSince)
      ..writeByte(5)
      ..write(obj.timeFrom)
      ..writeByte(6)
      ..write(obj.timeTill)
      ..writeByte(7)
      ..write(obj.isAG)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.shortDescription)
      ..writeByte(11)
      ..write(obj.weekDay)
      ..writeByte(12)
      ..write(obj.trainers)
      ..writeByte(13)
      ..write(obj.trainings)
      ..writeByte(14)
      ..write(obj.locationId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
