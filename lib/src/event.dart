import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'data.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends Data {
  Event(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.shortDescription,
      this.text,
      this.imageId})
      : super(id, text, removeHtmlContent(shortDescription), name,
            imageId: imageId);

  factory Event.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final image = json['image_id'] as int;
    final start = DateTime.parse(json['start_date']);
    final end = DateTime.parse(json['end_date']);
    final name = json['name'] as String;
    final shortdescr = json['short_description'] as String;
    final text = json['text'] as String;
    return Event(
        id: id,
        name: name,
        startDate: start,
        endDate: end,
        shortDescription: shortdescr.replaceAll('\n', '').replaceAll('\t', ''),
        text: text.replaceAll('\t', ''),
        imageId: image);
  }
  @HiveField(0)
  @override
  final int id;
  @HiveField(1)
  @override
  final int imageId;
  @HiveField(2)
  @override
  final String name;
  @HiveField(3)
  final DateTime startDate;
  @HiveField(4)
  final DateTime endDate;
  @HiveField(5)
  final String shortDescription;
  @HiveField(6)
  final String text;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'short_description': shortDescription,
        'text': text,
        'image_id': imageId,
        'start_date': DateFormat('yyyy-MM-dd HH:mm:ss').format(startDate),
        'end_date': DateFormat('yyyy-MM-dd HH:mm:ss').format(endDate),
      };

  @override
  String toString() =>
      'Event Super: ${super.toString()} Id: $id ImageId: $imageId Name: $name ShortDescr: $shortDescription Text: $text';
}
