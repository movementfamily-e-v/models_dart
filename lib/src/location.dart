import 'data.dart';

extension ToJson on List<ImageModel> {
  List<Map<String, dynamic>> toJson() {
    final List<Map<String, dynamic>> json = [];
    for (ImageModel img in this) {
      json.add(img.toJson());
    }
    return json;
  }
}

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
      : super(id, mainText, "$address $postalCode \n $city", name,
            imageId: imageId);

  factory Location.fromJson(Map<String, dynamic> json) {
    final int id = json['id'] as int;
    final int imageId = json['image_id'] as int;
    final double latitude = json['latitude'] as double;
    final double longitude = json['longitude'] as double;
    final String name = json['name'] as String;
    final String city = json['city'] as String;
    final String address = json['address'] as String;
    final int postalCode = json['post_code'] as int;
    final String shortDescr = json['short_description'] as String;
    final List<ImageModel> images = [];
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

  @override
  final int id;
  @override
  final String name;
  @override
  final String mainText;
  //String imagePath;
  @override
  final int imageId;
  final double longitude;
  final double latitude;
  final String city;
  final String address;
  final int postalCode;
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
      "Location Super: ${super.toString()} Id: $id ImageId: $imageId Name: $name Longi: $longitude Lati: $latitude Text: $mainText";
}

class ImageModel {
  ImageModel({this.imagePath, this.extraIdentifier, this.imageId});
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    final ImageModel image = ImageModel();
    image.imagePath = json['file_path'] as String ?? "";
    image.extraIdentifier = json['extra_identifier'] as String ?? "";
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
