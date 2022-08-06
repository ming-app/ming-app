import 'package:json_annotation/json_annotation.dart';

import 'entities.dart';

part 'journal.g.dart';

@JsonSerializable()
class AnimalJournalResponse {
  final String id;
  final String content;
  final String date;
  final int journalCount;
  final int like;
  final int volunteerCount;
  final UserInfoResponse writer;

  AnimalJournalResponse(
    this.id,
    this.content,
    this.date,
    this.journalCount,
    this.like,
    this.volunteerCount,
    this.writer,
  );

  factory AnimalJournalResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalJournalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalJournalResponseToJson(this);
}

@JsonSerializable()
class ShelterReviewResponse {
  final String id;
  final String comment;
  final String date;
  final UserInfoResponse writer;
  final UserListOverviewResponse volunteerOverview;

  ShelterReviewResponse(
    this.id,
    this.comment,
    this.date,
    this.writer,
    this.volunteerOverview,
  );

  factory ShelterReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ShelterReviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterReviewResponseToJson(this);
}
