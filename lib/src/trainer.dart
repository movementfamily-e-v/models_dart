import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'data.dart';
import 'user.dart';

part 'trainer.g.dart';

@HiveType(typeId: 9)
class Trainer extends Data {
  Trainer(this.imageId, this.user, this.shortDescription, this.mainText)
      : super(user.id, mainText, shortDescription, user.fullName,
            imageId: imageId);

  factory Trainer.fromJson(Map<String, dynamic> json) {
    final imageid = json['image_id'] as int;
    final shortdescr = json['short_description'] as String;
    final mainText = json['text'] as String;

    return Trainer(imageid, User.fromJson(json), shortdescr, mainText);
  }

  factory Trainer.fromCreate(
          {int userId,
          DateTime userBirthDate,
          String shortDescr,
          String text,
          int imageId}) =>
      Trainer(
        imageId,
        User.fromCreateTrainer(
          userId: userId,
        ),
        "Geburtsdatum: ${DateFormat("dd.MM.yyyy").format(userBirthDate)}, Trainer: $shortDescr",
        text,
      );
  factory Trainer.fromUpdate(
          {int userId,
          DateTime userBirthDate,
          String shortDescr,
          String text,
          int imageId}) =>
      Trainer(
        imageId,
        User.fromCreateTrainer(
          userId: userId,
        ),
        '$shortDescr',
        text,
      );
  @HiveField(0)
  @override
  final int imageId;
  @HiveField(1)
  final User user;
  @HiveField(2)
  final String shortDescription;
  @override
  @HiveField(3)
  final String mainText;

  @override
  String toString() =>
      'Trainer Super: ${super.toString()} Id: $id ImageId: $imageId Name: $name ShortDescr: $shortDescription Text: $mainText';

  Map<String, dynamic> toCreateJson() => <String, dynamic>{
        'id': user.id,
        'image_id': imageId,
        'short_description': shortDescription,
        'text': mainText
      };
}
