import 'package:json_annotation/json_annotation.dart';

part 'term.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Term {
  final String id;
  final String desc;

  Term(this.id, this.desc);

  Map<String, dynamic> toJson() => _$TermToJson(this);

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
}
