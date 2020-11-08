import 'data.dart';

class News extends Data {
  News(
      {this.wordPressId,
      this.createdDate,
      this.id,
      this.imageId,
      this.name,
      this.shortDescription,
      this.text,
      this.youtubeUrl})
      : super(id, text, removeHtmlContent(shortDescription), name,
            imageId: imageId);

  factory News.fromJson(Map<String, dynamic> json) {
    final int id = json['id'] as int;
    final int image = json['image_id'] as int;
    final String name = json['name'] as String;
    final String shortdescr = json['short_description'] as String;
    final String text = json['text'] as String;
    final String youtube = json['youtube_url'] as String ?? "";
    final DateTime created = json['creation_date'] == null
        ? DateTime.now()
        : DateTime.parse(json['creation_date']);
    final int wpid = json['wordpress_id'] ?? -1;
    return News(
        wordPressId: wpid,
        createdDate: created,
        id: id,
        imageId: image,
        name: name,
        shortDescription: shortdescr.replaceAll('\n', '').replaceAll('\t', ''),
        text: text.replaceAll('\t', ''),
        youtubeUrl: youtube);
  }

  final int id;
  final int imageId;
  final String name;
  final String shortDescription;
  final String text;
  final String youtubeUrl;
  final DateTime createdDate;
  final int wordPressId;

  Map<String, dynamic> toJson() => {
        'name': name,
        'short_description': shortDescription,
        'text': text,
        'image_id': imageId,
        'youtube_url': youtubeUrl ?? '',
        'creation_date': createdDate ?? '',
        'wordpress_id': wordPressId ?? '',
      };

  @override
  String toString() =>
      'News Super: ${super.toString()} Id: $id ImageId: $imageId Name: $name ShortDescr: $shortDescription Text: $text creation_date: $createdDate wordpress_id: $wordPressId';
}
