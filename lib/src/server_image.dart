import 'package:hive/hive.dart';

part 'server_image.g.dart';

@HiveType(typeId: 6)
class ServerImage {
  const ServerImage(this.id, this.filePath, this.extraIdentifier);

  factory ServerImage.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final path = json['file_path'] as String;
    final extra = json['extra_identifier'] as String ?? '';
    return ServerImage(id, path, extra);
  }
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String filePath;
  @HiveField(2)
  final String extraIdentifier;

  @override
  String toString() =>
      'ServerImage: Id $id FilePath: $filePath ExtraIdentifier: $extraIdentifier';
}
