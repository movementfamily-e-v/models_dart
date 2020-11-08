import 'package:intl/intl.dart';

import 'data.dart';
import 'user.dart';

class Trainer extends Data {
  Trainer(this.imageId, this.user, this.shortDescription, this.mainText)
      : super(user.id, mainText, shortDescription, user.fullName,
            imageId: imageId);

  factory Trainer.fromJson(Map<String, dynamic> json) {
    final int imageid = json['image_id'] as int;
    final String shortdescr = (json['short_description'] as String);
    final String mainText = json['text'] as String;
    final User user = User.fromJson(json);
    return Trainer(imageid, user, shortdescr, mainText);
  }

  factory Trainer.fromCreate(
          {int userId,
          DateTime userBirthDate,
          shortDescr,
          text,
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
          shortDescr,
          text,
          int imageId}) =>
      Trainer(
        imageId,
        User.fromCreateTrainer(
          userId: userId,
        ),
        '$shortDescr',
        text,
      );

  @override
  final int imageId;
  final User user;
  final String shortDescription;
  @override
  final String mainText;

  @override
  String toString() =>
      'Trainer Super: ${super.toString()} Id: $id ImageId: $imageId Name: $name ShortDescr: $shortDescription Text: $mainText';

  Map<String, dynamic> toCreateJson() => {
        'id': user.id,
        'image_id': imageId,
        'short_description': shortDescription,
        'text': mainText
      };
}
