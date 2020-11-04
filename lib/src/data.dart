import 'package:html_unescape/html_unescape_small.dart';

final converter = HtmlUnescape();

class Data {
  final int id;
  final String mainText;
  final String subText;
  final int imageId;
  final String name;
  const Data(this.id, this.mainText, this.subText, this.name, {this.imageId});

  @override
  String toString() => "Id: $id ImageId: $imageId Name: $name Text: $mainText";
}
