import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageResponse {
  final String id;
  final String url;

  ImageResponse(this.id, this.url);

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

enum ImageType {
  animal("ANIMAL"),
  shelter("SHELTER"),
  user("USER");

  const ImageType(this.value);
  final String value;

  @override
  String toString() => value;
}
