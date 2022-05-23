// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timestamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeStamp _$TimeStampFromJson(Map<String, dynamic> json) => TimeStamp(
      json['year'] as int,
      json['month'] as int,
      json['day'] as int,
      json['date'] as int,
      json['hours'] as int,
      json['minutes'] as int,
      json['seconds'] as int,
      json['nanos'] as int,
      json['time'] as int,
      json['timezoneOffset'] as int,
    );

Map<String, dynamic> _$TimeStampToJson(TimeStamp instance) => <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'hours': instance.hours,
      'minutes': instance.minutes,
      'month': instance.month,
      'nanos': instance.nanos,
      'seconds': instance.seconds,
      'time': instance.time,
      'timezoneOffset': instance.timezoneOffset,
      'year': instance.year,
    };
