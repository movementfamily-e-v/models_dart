import 'package:html_unescape/html_unescape_small.dart';

final _converter = HtmlUnescape();
final _regExpr = RegExp(r'([<][/]*[a-z]+[>])');
String removeHtmlContent(String value) =>
    _converter.convert(value.replaceAll(_regExpr, ''));

class Data {
  const Data(this.id, this.mainText, this.subText, this.name, {this.imageId});
  final int id;
  final String mainText;
  final String subText;
  final int imageId;
  final String name;

  @override
  String toString() => 'Id: $id ImageId: $imageId Name: $name Text: $mainText';
}
