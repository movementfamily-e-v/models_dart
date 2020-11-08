import 'package:intl/intl.dart';

import 'data.dart';

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
    final int id = json['id'] as int;
    final int image = json['image_id'] as int;
    final DateTime start = DateTime.parse(json['start_date']);
    final DateTime end = DateTime.parse(json['end_date']);
    final String name = json['name'] as String;
    final String shortdescr = json['short_description'] as String;
    final String text = json['text'] as String;
    return Event(
        id: id,
        name: name,
        startDate: start,
        endDate: end,
        shortDescription: shortdescr.replaceAll("\n", "").replaceAll("\t", ""),
        text: text.replaceAll("\t", ""),
        imageId: image);
  }

  @override
  final int id;
  @override
  final int imageId;
  @override
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String shortDescription;
  final String text;

  Map<String, dynamic> toJson() => {
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
