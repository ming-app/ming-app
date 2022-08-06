// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalJournalResponse _$AnimalJournalResponseFromJson(
        Map<String, dynamic> json) =>
    AnimalJournalResponse(
      json['id'] as String,
      json['content'] as String,
      json['date'] as String,
      json['journalCount'] as int,
      json['like'] as int,
      json['volunteerCount'] as int,
      UserInfoResponse.fromJson(json['writer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalJournalResponseToJson(
        AnimalJournalResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'date': instance.date,
      'journalCount': instance.journalCount,
      'like': instance.like,
      'volunteerCount': instance.volunteerCount,
      'writer': instance.writer,
    };

ShelterReviewResponse _$ShelterReviewResponseFromJson(
        Map<String, dynamic> json) =>
    ShelterReviewResponse(
      json['id'] as String,
      json['comment'] as String,
      json['date'] as String,
      UserInfoResponse.fromJson(json['writer'] as Map<String, dynamic>),
      UserListOverviewResponse.fromJson(
          json['volunteerOverview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShelterReviewResponseToJson(
        ShelterReviewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'date': instance.date,
      'writer': instance.writer,
      'volunteerOverview': instance.volunteerOverview,
    };
