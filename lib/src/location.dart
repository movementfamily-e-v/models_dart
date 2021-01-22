import 'package:hive/hive.dart';

import 'data.dart';

part 'location.g.dart';

extension ToJson on List<ImageModel> {
  List<Map<String, dynamic>> toJson() {
    final List<Map<String, dynamic>> json = [];
    for (final img in this) {
      json.add(img.toJson());
    }
    return json;
  }
}

@HiveType(typeId: 4)
class Location extends Data {
  Location(
      {this.mainText,
      this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.city,
      this.address,
      this.postalCode,
      this.imageId,
      this.images})
      : super(id, mainText, '$address $postalCode \n $city', name,
            imageId: imageId);

  factory Location.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final imageId = json['image_id'] as int;
    final latitude = json['latitude'] as double;
    final longitude = json['longitude'] as double;
    final name = json['name'] as String;
    final city = json['city'] as String;
    final address = json['address'] as String;
    final postalCode = json['post_code'] as int;
    final shortDescr = json['short_description'] as String;
    final images = <ImageModel>[];
    if (json['images'] as List != null) {
      (json['images'] as List).forEach((image) {
        if (image != null) images.add(ImageModel.fromJson(image));
      });
    }
    return Location(
        mainText: shortDescr,
        id: id,
        name: name,
        latitude: latitude,
        longitude: longitude,
        city: city,
        address: address,
        postalCode: postalCode,
        imageId: imageId,
        images: images);
  }
  @HiveField(0)
  @override
  final int id;
  @HiveField(1)
  @override
  final String name;
  @HiveField(2)
  @override
  final String mainText;
  //String imagePath;
  @HiveField(3)
  @override
  final int imageId;
  @HiveField(4)
  final double longitude;
  @HiveField(5)
  final double latitude;
  @HiveField(6)
  final String city;
  @HiveField(7)
  final String address;
  @HiveField(8)
  final int postalCode;
  @HiveField(9)
  List<ImageModel> images;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'short_description': mainText,
        'latitude': latitude,
        'longitude': longitude,
        'city': city,
        'post_code': postalCode,
        'address': address,
        'image_id': imageId,
        'images': images.toJson()
      };

  @override
  String toString() =>
      'Location Super: ${super.toString()} Id: $id ImageId: $imageId Name: $name Longi: $longitude Lati: $latitude Text: $mainText';
}

class ImageModel {
  ImageModel({this.imagePath, this.extraIdentifier, this.imageId});
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    final image = ImageModel();
    image.imagePath = json['file_path'] as String ?? '';
    image.extraIdentifier = json['extra_identifier'] as String ?? '';
    image.imageId = json['id'] as int ?? -1;
    return image;
  }

  String imagePath;
  String extraIdentifier;
  int imageId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': imageId,
        'extra_identifier': extraIdentifier,
        'file_path': imagePath
      };
}
