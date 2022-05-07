import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Post {
  final String id;
  final String userId;
  final String animalId;
  final String imageUrl;
  final String desc;
  final String createdAt;

  Post(this.id, this.userId, this.animalId, this.imageUrl, this.desc, this.createdAt);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
