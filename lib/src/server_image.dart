class ServerImage {
  const ServerImage(this.id, this.filePath, this.extraIdentifier);

  factory ServerImage.fromJson(Map<String, dynamic> json) {
    final int id = json['id'] as int;
    final String path = json['file_path'] as String;
    final String extra = json['extra_identifier'] as String ?? "";
    return ServerImage(id, path, extra);
  }

  final int id;
  final String filePath;
  final String extraIdentifier;

  @override
  String toString() =>
      'ServerImage: Id $id FilePath: $filePath ExtraIdentifier: $extraIdentifier';
}
