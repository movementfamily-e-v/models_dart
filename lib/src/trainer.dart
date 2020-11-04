import 'package:intl/intl.dart';

import 'data.dart';
import 'user.dart';

class Trainer extends Data {
  final int imageId;
  final User user;
  final String shortDescription;
  final String mainText;
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

  @override
  String toString() =>
      "Trainer Super: ${super.toString()} Id: $id ImageId: $imageId Name: $name ShortDescr: $shortDescription Text: $mainText";

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
        "$shortDescr",
        text,
      );
  Map<String, dynamic> toCreateJson() => {
        'id': this.user.id,
        'image_id': this.imageId,
        'short_description': this.shortDescription,
        'text': this.mainText
      };
}
